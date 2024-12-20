//
//  EpisodeService.swift
//  RickAndMortyApp
//
//  Created by Alumno on 6/11/24.
//

import Foundation

class EpisodeService {
    let url = "https://rickandmortyapi.com/api/episode"
    
    func getAllEpisodes(completion: @escaping ([Episode]?, String? ) -> Void) {
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                
                guard let data = data else { return }
                 
                do {
                    let episodesResponse = try JSONDecoder().decode(EpisodesResponse.self, from: data)
                    let episodesDto = episodesResponse.results
                    var episodes: [Episode] = []
                    
                    let mainDispatchGroup = DispatchGroup()
                    
                    
                    episodesDto.forEach{ episodeDto in
                        mainDispatchGroup.enter()

                        let dispatchGroup = DispatchGroup()
                        var characters: [Character] = []
                        episodeDto.characters.forEach { url in
                            dispatchGroup.enter()
                            CharacterService().getCharacterById(url: url) { character, message in
                                guard let character = character else { return  }
                                characters.append(character)
                                dispatchGroup.leave()
                            }
                        }
                        dispatchGroup.notify(queue: .main) {
                            let episode = Episode(id: episodeDto.id, name: episodeDto.name, airDate: episodeDto.airDate, description: episodeDto.episode, characters: characters )
                            episodes.append(episode)
                            mainDispatchGroup.leave()

                        }
                        
                    }
                    mainDispatchGroup.notify(queue: .main) {
                        completion(episodes, nil)
                    }
                    
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            }  else {
                completion(nil, "Error: \(message ?? "no response")")
            }
        }
    }
}
