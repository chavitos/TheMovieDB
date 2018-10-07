//
//  Seeds.swift
//  TheMovieDBTests
//
//  Created by Tiago Chaves on 06/10/2018.
//  Copyright © 2018 TiagoChaves. All rights reserved.
//

@testable import TheMovieDB
import Foundation

struct Seeds{
    
    struct DisplayUpcomingMovieList {
        
        static let movie1  = DisplayUpcomingMovie(posterPath: "/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg",
                                                  backdropPath: "/f4E0ocYeToEuXvczZv6QArrMDJ.jpg",
                                                  overview: "From the outer reaches of space to the small-town streets of suburbia, the hunt comes home. Now, the universe’s most lethal hunters are stronger, smarter and deadlier than ever before, having genetically upgraded themselves with DNA from other species. When a young boy accidentally triggers their return to Earth, only a ragtag crew of ex-soldiers and a disgruntled science teacher can prevent the end of the human race.",
                                                  releaseDate: "September 13, 2018",
                                                  genre: ["Action","Science Fiction","Comedy","Horror"],
                                                  title: "The Predator")
        
        static let movie2  = DisplayUpcomingMovie(posterPath: "/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
                                                  backdropPath: "/840rbblaLc4SVxm8gF3DNdJ0YAE.jpg",
                                                  overview: "Seasoned musician Jackson Maine discovers—and falls in love with—struggling artist Ally. She has just about given up on her dream to make it big as a singer—until Jack coaxes her into the spotlight. But even as Ally's career takes off, the personal side of their relationship is breaking down, as Jack fights an ongoing battle with his own internal demons.",
                                                  releaseDate: "October 03, 2018",
                                                  genre: ["Music","Romance","Drama"],
                                                  title: "A Star Is Born")
        
        static let movie3  = DisplayUpcomingMovie(posterPath: "/gjAFM4xhA5vyLxxKMz38ujlUfDL.jpg",
                                                  backdropPath: "/m03jul0YdVEOFXEQVUv6pOVQYGL.jpg",
                                                  overview: "Dracula, Mavis, Johnny and the rest of the Drac Pack take a vacation on a luxury Monster Cruise Ship, where Dracula falls in love with the ship’s captain, Ericka, who’s secretly a descendant of Abraham Van Helsing, the notorious monster slayer.",
                                                  releaseDate: "June 28, 2018",
                                                  genre: ["Family", "Fantasy", "Animation", "Comedy"],
                                                  title: "Hotel Transylvania 3: Summer Vacation")
        
        static let movie4  = DisplayUpcomingMovie(posterPath: "/msqWSQkU403cQKjQHnWLnugv7EY.jpg",
                                                  backdropPath: "/tnwMCH4yLBY4qpe6Nr4n66u4U3f.jpg",
                                                  overview: "Agent Matt Graver teams up with operative Alejandro Gillick to prevent Mexican drug cartels from smuggling terrorists across the United States border.",
                                                  releaseDate: "June 27, 2018",
                                                  genre: ["Action", "Thriller", "Crime", "Drama"],
                                                  title: "Sicario: Day of the Soldado")
        
        static let movie5  = DisplayUpcomingMovie(posterPath: "/msqWSQkU403cQKjQHnWLnugv7EY.jpg",
                                                  backdropPath: "/tnwMCH4yLBY4qpe6Nr4n66u4U3f.jpg",
                                                  overview: "Disaster strikes when a criminal mastermind reveals the identities of all active undercover agents in Britain. The secret service can now rely on only one man—Johnny English. Currently teaching at a minor prep school, Johnny springs back into action to find the mysterious hacker. For this mission to succeed, he’ll need all of his skills—what few he has—as the man with yesterday’s analogue methods faces off against tomorrow’s digital technology.",
                                                  releaseDate: "September 13, 2018",
                                                  genre: ["Action", "Adventure", "Family", "Comedy"],
                                                  title: "Johnny English Strikes Again")
        
        static let movie6  = DisplayUpcomingMovie(posterPath: "/4nKoB6wMVXfsYgRZK5lHZ5VMQ6J.jpg",
                                                  backdropPath: "/7t88SoT3Dd8DhGnQuVoSbMNUl3W.jpg",
                                                  overview: "A bright young yeti finds something he thought didn't exist—a human. News of this “smallfoot” throws the simple yeti community into an uproar over what else might be out there in the big world beyond their snowy village.",
                                                  releaseDate: "September 20, 2018",
                                                  genre: ["Adventure", "Family", "Fantasy", "Animation", "Comedy"],
                                                  title: "Smallfoot")
        
        static let movie7  = DisplayUpcomingMovie(posterPath: "/iNtFgXqXPRMkm1QO8CHn5sHfUgE.jpg",
                                                  backdropPath: "/gb3TVVZNNxVGNfS1NxGaiWZfwnW.jpg",
                                                  overview: "Seven strangers, each with a secret to bury, meet at Lake Tahoe's El Royale, a rundown hotel with a dark past in 1969. Over the course of one fateful night, everyone will have a last shot at redemption.",
                                                  releaseDate: "October 04, 2018",
                                                  genre: ["Thriller", "Crime", "Horror"],
                                                  title: "Bad Times at the El Royale")
        
        static let movie8  = DisplayUpcomingMovie(posterPath: "/m0yf7J7HsKeK6E81SMRcX8vx6mH.jpg",
                                                  backdropPath: "/mqbAmIiToU2R4VwZGgCqsfy6Yh4.jpg",
                                                  overview: "The Shadow Mountains, 1983. Red and Mandy lead a loving and peaceful existence; but when their pine-scented haven is savagely destroyed, Red is catapulted into a phantasmagoric journey filled with bloody vengeance and laced with fire.",
                                                  releaseDate: "September 13, 2018",
                                                  genre: ["Action", "Thriller", "Horror"],
                                                  title: "Mandy")
        
        static let movie9  = DisplayUpcomingMovie(posterPath: "/awGdHLQdPARAWyiT4hzu1ZFdsHO.jpg",
                                                  backdropPath: "/c5GHB444LQShWnO29ulpFMLo4Am.jpg",
                                                  overview: "A father and daughter live a perfect but mysterious existence in Forest Park, a beautiful nature reserve near Portland, Oregon, rarely making contact with the world. But when a small mistake tips them off to authorities, they are sent on an increasingly erratic journey in search of a place to call their own.",
                                                  releaseDate: "June 29, 2018",
                                                  genre: ["Drama"],
                                                  title: "Leave No Trace")
        
        static let movie10 = DisplayUpcomingMovie(posterPath: "/fZnPtTHw7TfOQoLz3MeAUSLvNK5.jpg",
                                                  backdropPath: "/d72Cc53MhCnTqwv0VZ4CFb8nXXX.jpg",
                                                  overview: "After a violent encounter with his boss' men, Roy finds a prostitute and sees something in her frightened, defiant eyes that prompts a fateful decision. He takes her with him as he flees to Galveston, an action as ill-advised as it is inescapable.",
                                                  releaseDate: "October 07, 2018",
                                                  genre: ["Thriller", "Drama"],
                                                  title: "Galveston")
        
        static let movieList = [movie1,
                                movie2,
                                movie3,
                                movie4,
                                movie5,
                                movie6,
                                movie7,
                                movie8,
                                movie9,
                                movie10]
        
        static let result = DisplayUpcomingMoviesResult(nextPage: 2, upcomingMovies: movieList)
    }
    
    struct UpcomingMoviesAPIList {
        static let movie1  = UpcomingMovie(id: 1,
                                           posterPath: "/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg",
                                           backdropPath: "/f4E0ocYeToEuXvczZv6QArrMDJ.jpg",
                                           overview: "From the outer reaches of space to the small-town streets of suburbia, the hunt comes home. Now, the universe’s most lethal hunters are stronger, smarter and deadlier than ever before, having genetically upgraded themselves with DNA from other species. When a young boy accidentally triggers their return to Earth, only a ragtag crew of ex-soldiers and a disgruntled science teacher can prevent the end of the human race.",
                                           releaseDate: "2018-09-13",
                                           genre: [27,
                                                   878,
                                                   28,
                                                   35],
                                           title:"The Predator")
        
        static let movie2  = UpcomingMovie(id: 2,
                                           posterPath: "/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
                                           backdropPath: "/840rbblaLc4SVxm8gF3DNdJ0YAE.jpg",
                                           overview: "Seasoned musician Jackson Maine discovers—and falls in love with—struggling artist Ally. She has just about given up on her dream to make it big as a singer—until Jack coaxes her into the spotlight. But even as Ally's career takes off, the personal side of their relationship is breaking down, as Jack fights an ongoing battle with his own internal demons.",
                                           releaseDate: "2018-10-03",
                                           genre: [18,
                                                   10402,
                                                   10749],
                                           title:"A Star Is Born")
        
        static let movie3  = UpcomingMovie(id: 3,
                                           posterPath: "/gjAFM4xhA5vyLxxKMz38ujlUfDL.jpg",
                                           backdropPath: "/m03jul0YdVEOFXEQVUv6pOVQYGL.jpg",
                                           overview: "Dracula, Mavis, Johnny and the rest of the Drac Pack take a vacation on a luxury Monster Cruise Ship, where Dracula falls in love with the ship’s captain, Ericka, who’s secretly a descendant of Abraham Van Helsing, the notorious monster slayer.",
                                           releaseDate: "2018-06-28",
                                           genre: [10751,
                                                   14,
                                                   35,
                                                   16],
                                           title: "Hotel Transylvania 3: Summer Vacation")
        
        static let movie4  = UpcomingMovie(id: 4,
                                           posterPath: "/msqWSQkU403cQKjQHnWLnugv7EY.jpg",
                                           backdropPath: "/tnwMCH4yLBY4qpe6Nr4n66u4U3f.jpg",
                                           overview: "Agent Matt Graver teams up with operative Alejandro Gillick to prevent Mexican drug cartels from smuggling terrorists across the United States border.",
                                           releaseDate: "2018-06-27",
                                           genre: [28,
                                                   80,
                                                   18,
                                                   53],
                                           title:"Sicario: Day of the Soldado")
        
        static let movie5  = UpcomingMovie(id: 5,
                                           posterPath: "/msqWSQkU403cQKjQHnWLnugv7EY.jpg",
                                           backdropPath: "/tnwMCH4yLBY4qpe6Nr4n66u4U3f.jpg",
                                           overview: "Disaster strikes when a criminal mastermind reveals the identities of all active undercover agents in Britain. The secret service can now rely on only one man—Johnny English. Currently teaching at a minor prep school, Johnny springs back into action to find the mysterious hacker. For this mission to succeed, he’ll need all of his skills—what few he has—as the man with yesterday’s analogue methods faces off against tomorrow’s digital technology.",
                                           releaseDate: "2018-09-13",
                                           genre: [12,
                                                   10751,
                                                   28,
                                                   35],
                                           title:"Johnny English Strikes Again")
        
        static let movie6  = UpcomingMovie(id: 6,
                                           posterPath: "/4nKoB6wMVXfsYgRZK5lHZ5VMQ6J.jpg",
                                           backdropPath: "/7t88SoT3Dd8DhGnQuVoSbMNUl3W.jpg",
                                           overview: "A bright young yeti finds something he thought didn't exist—a human. News of this “smallfoot” throws the simple yeti community into an uproar over what else might be out there in the big world beyond their snowy village.",
                                           releaseDate: "2018-09-20",
                                           genre: [35,
                                                   16,
                                                   10751,
                                                   12,
                                                   14],
                                           title: "Smallfoot")
        
        static let movie7  = UpcomingMovie(id: 7,
                                           posterPath: "/iNtFgXqXPRMkm1QO8CHn5sHfUgE.jpg",
                                           backdropPath: "/gb3TVVZNNxVGNfS1NxGaiWZfwnW.jpg",
                                           overview: "Seven strangers, each with a secret to bury, meet at Lake Tahoe's El Royale, a rundown hotel with a dark past in 1969. Over the course of one fateful night, everyone will have a last shot at redemption.",
                                           releaseDate: "2018-10-04",
                                           genre: [53,
                                                   27,
                                                   80],
                                           title: "Bad Times at the El Royale")
        
        static let movie8  = UpcomingMovie(id: 8,
                                           posterPath: "/m0yf7J7HsKeK6E81SMRcX8vx6mH.jpg",
                                           backdropPath: "/mqbAmIiToU2R4VwZGgCqsfy6Yh4.jpg",
                                           overview: "The Shadow Mountains, 1983. Red and Mandy lead a loving and peaceful existence; but when their pine-scented haven is savagely destroyed, Red is catapulted into a phantasmagoric journey filled with bloody vengeance and laced with fire.",
                                           releaseDate: "2018-09-13",
                                           genre: [28,
                                                   53,
                                                   27],
                                           title: "Mandy")
        
        static let movie9  = UpcomingMovie(id: 9,
                                           posterPath: "/awGdHLQdPARAWyiT4hzu1ZFdsHO.jpg",
                                           backdropPath: "/c5GHB444LQShWnO29ulpFMLo4Am.jpg",
                                           overview: "A father and daughter live a perfect but mysterious existence in Forest Park, a beautiful nature reserve near Portland, Oregon, rarely making contact with the world. But when a small mistake tips them off to authorities, they are sent on an increasingly erratic journey in search of a place to call their own.",
                                           releaseDate: "2018-06-29",
                                           genre: [18],
                                           title: "Leave No Trace")
        
        static let movie10 = UpcomingMovie(id: 10,
                                           posterPath: "/fZnPtTHw7TfOQoLz3MeAUSLvNK5.jpg",
                                           backdropPath: "/d72Cc53MhCnTqwv0VZ4CFb8nXXX.jpg",
                                           overview: "After a violent encounter with his boss' men, Roy finds a prostitute and sees something in her frightened, defiant eyes that prompts a fateful decision. He takes her with him as he flees to Galveston, an action as ill-advised as it is inescapable.",
                                           releaseDate: "2018-10-07",
                                           genre: [18,
                                                   53],
                                           title: "Galveston")
        
        static let movieList = [movie1,
                                movie2,
                                movie3,
                                movie4,
                                movie5,
                                movie6,
                                movie7,
                                movie8,
                                movie9,
                                movie10]
        
        static let result = UpcomingMovieResult(page: 1, totalPages: 18, totalResults: 350, results: movieList)
    }
}
