//
//  CastDetailViewModel.swift
//  TMDB
//
//  Created by AVINASH on 03/06/26.
//

import Foundation
import Combine

class CastDetailViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case loaded
        case error(Error)
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    @Published var person: Person?
    
    public var castError: Error?
    
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    private let getCastDetailUseCase: CastDetailUseCase
    
    init(getCastDetailUseCase: CastDetailUseCase) {
        self.getCastDetailUseCase = getCastDetailUseCase
    }
    
    func fetchCastDetails(castDetail: String) async {
        state = .loading
        do {
            person = try await getCastDetailUseCase.execute(creditId: castDetail)
            state = .loaded
        } catch {
            hasError = true
            castError = error
            state = .error(error)
        }
    }
}
