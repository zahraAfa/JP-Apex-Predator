//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Anisa Fatimah Azzahra on 27/06/23.
//

import SwiftUI

struct PredatorDetail: View {
    let predator : ApexPredator
    
    var body: some View {
        ScrollView{
            VStack(alignment: .trailing){
                Image(predator.type).resizable().scaledToFit()
                Image(predator.name.lowercased().filter {
                    $0 != " "
                }).resizable().scaledToFit().frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                    .shadow(color: .white, radius: 1)
                    .offset(y: -210)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y:1, z: 0))
                
                VStack(alignment: .leading) {
                    Text(predator.name).font(.largeTitle).padding(.bottom, 8)
                    Text("Appears in: ").font(.title3)
                    
                    ForEach(predator.movies, id: \.self) { movie in //assigning the string in movie itself as an identifier
                        Text("•" + movie).font(.subheadline)
                    }
                    
                    Text("Movie Moments").font(.title).padding(.top, 15)
                    
                    ForEach(predator.movieScenes){scene in
                        Text(scene.movie).font(.title2).padding([.top, .bottom], 1)
                        
                        Text(scene.sceneDescription)
                    }
                    
                    Text("Read More: ").font(.caption).padding(.top, 15)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundColor(.blue)
                }.padding(.top, -230)
                    .padding()
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = MovieScene(id: 1, movie: "Jurassic Park", sceneDescription: "The Brachiosaurus was the first dinosaur encountered by the endorsement team hired by InGen to make sure Jurassic Park was safe for visitors. The entire team was amazed. Dr. Alan Grant and Dr. Ellie Sattler were the most awestruck of the group because the Brachiosaurus was terrestrial, not semi-aquatic swamp dwellers they had thought they were.\n\nWhen Dennis Nedry disabled Jurassic Park's security systems, the security fences that kept the prehistoric animals from escaping their enclosures were disabled as well, Brachiosaurus was one of the dinosaurs that were able to roam freely.\n\nAfter fleeing from the Tyrannosaur Paddock, Dr. Alan Grant and Tim and Lex Murphy climbed a tree where saw a herd of Brachiosaurus feeding on the nearby trees, hooting in the distance. Dr. Alan Grant heard their calls and attempted to imitate them to successful results. The following morning, a Brachiosaurus sick with a cold or a similar disease fed on the tree that the three humans were sleeping in, waking them up. Lex panicked at the sight of the dinosaur, believing it to be dangerous at first, but she soon calmed down when Dr. Alan Grant and her brother showed her that it was harmless. Dr. Grant fed the Brachiosaurus a nearby branch on the tree and Tim Murphy even pet it. However, when Lex attempted to pet the dinosaur like her brother did, the Brachiosaurus responded by sneezing on her. The humans and the Brachiosaurus later went their separate ways.\n\nIt is unknown what happened to the Brachiosaur populations on Isla Nublar after the Isla Nublar Incident of 1993.\n\nHowever, according to information revealed by InGen reports, there were at least 5 surviving Brachiosaurus on the island by October 1994. One died due to malnutrition.")
        
        let movies = [
            "Jurassic Park",
            "Jurassic Park III",
            "Jurassic World: Fallen Kingdom"
        ]
        
        let predator = ApexPredator(id: 1, name: "Brachiosaurus", type: "land", movies: movies, movieScenes: [movieScene], link: "https://jurassicpark.fandom.com/wiki/Brachiosaurus")
        
        PredatorDetail(predator: predator)
    }
    
}
