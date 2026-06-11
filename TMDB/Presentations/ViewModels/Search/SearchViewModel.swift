//
//  SearchViewModel.swift
//  TMDB
//
//  Created by AVINASH on 10/06/26.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var filteredMovies: [Movie]?
    @Published var searchText: String = ""
    private var cancellables = Set<AnyCancellable>()
    
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    private let getMovieSearchUseCase: GetMovieSearchUseCase
    
    init(getMovieSearchUseCase: GetMovieSearchUseCase) {
        self.getMovieSearchUseCase = getMovieSearchUseCase
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.8, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .handleEvents(receiveOutput: { output in
                self.state = .loading
            })
            .setFailureType(to: MovieError.self)
            .flatMap { query in
                Future<[Movie], MovieError> { promise in
                    if query.isEmpty {
                        return promise(.success([]))
                    }
                    Task {
                        do {
                            let results: [Movie] = try await self.getMovieSearchUseCase.execute(query: query)
                            promise(.success(results))
                        } catch {
                            promise(.failure(.searchNotFound(query: query)))
                        }
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .handleEvents(receiveOutput: { output in
                self.state = .idle
            })
            .sink { _ in
                print("Received")
            } receiveValue: { movies in
                self.movies = movies
            }
            .store(in: &cancellables)
    }

}
