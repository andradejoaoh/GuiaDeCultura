//
//  fileReader.swift
//  miniChallenge
//
//  Created by João Henrique Andrade on 06/05/19.
//  Copyright © 2019 João Henrique Andrade. All rights reserved.
//

import Foundation

class JSONHandler{
    static let shared = JSONHandler()

    var vetorCentros = [Places]()
    var vetorEventos = [Event]()
    private init() { }
    
    
    public func lerArquivoCentros(){
        if let pathCentrosCulturais = URL(string: "https://raw.githubusercontent.com/wiki/andradejoaoh/GuiaDeCultura/centrosCulturais.txt"){
            do {
                let conteudoCentrosCulturais = try String(contentsOf: pathCentrosCulturais, encoding: .utf8)
                let vetorCentroCulturais = conteudoCentrosCulturais.split(separator: ";")
                let numeroDeCentros = vetorCentroCulturais.count/4
                
                for i in 0..<numeroDeCentros {
                    let local = Places(nome: String(vetorCentroCulturais[i*4]), descricao: String(vetorCentroCulturais[i*4+1]), local: String(vetorCentroCulturais[i*4+2]), horFunc: String(vetorCentroCulturais[i*4+3]))
                    vetorCentros.append(local)
                }
            }
            catch {/* error handling here */}
        }
    }
    
    func testeAPI(completion: @escaping ([Event], Error?)->Void){
        guard let url = URL(string: "https://api.predicthq.com/v1/events/?q=&category=concerts,festivals,performing-arts&rank_level=3,4,5&location_around.origin=-23.5505,-46.6333&location_around.offset=10km") else
        {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer CmDBZy324VA3fxaIk3lFDWIY4QiIAX", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { print("Empty data"); return }
            do {
                let predictHQResult = try JSONDecoder().decode(PredictHQResult.self, from: data)
                
                let events = predictHQResult.results.map({ (hq) -> Event in
                    var local:String = "Sem endereço"
                    var nome:String = "sem nome"
                    var data:String = ""
                    var horario:String = ""
                    var numeroEnd = ""
                    if hq.entities.count > 0 {
                        local = hq.entities[0].formattedAddress
                        
                        if (local.contains("Rua")){
                            local = local.replacingOccurrences(of: "Rua", with: "R.")
                        } else if (local.contains("Avenida")){
                            local = local.replacingOccurrences(of: "Avenida", with: "Av.")
                        }
                        
                        if (local.first?.isNumber == true){
                            while(local.first?.isNumber != false){
                                numeroEnd += String(local.removeFirst())
                            }
                            local.removeFirst()
                        }
                        let partesEnd = local.split(separator: "\n", maxSplits: 1, omittingEmptySubsequences: true)
                        local = partesEnd[0] + ", " + numeroEnd
                        
                        var formatacaoHorario = hq.start
                        formatacaoHorario.removeFirst(10)
                        horario = String(formatacaoHorario.prefix(6))
                        horario = horario.replacingOccurrences(of: "T", with: "")
                        
                        data = String(hq.start.prefix(10))
                        data = data.replacingOccurrences(of: "-", with: "/")
                        data += String("/")
                        let partesData = data.split(separator: "/")
                        data = partesData[2] + "/" + partesData[1] + "/" + partesData[0]
                        
                        nome = String(hq.title.prefix(25))
                    }
                    let event = Event(nome: nome, data: data, local: local, descricao: hq.resultDescription, categoria: hq.category, horario: horario)
                    
                    return event
                })
                
                completion(events, nil)
            }catch{
                completion([], error)
            }

            }.resume()
    }
}




