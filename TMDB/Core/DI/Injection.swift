//
//  Injection.swift
//  TMDB
//
//  Created by AVINASH on 30/05/26.
//

import Foundation
import FactoryKit

// MARK: - Injecting Services
extension Container {
    @MainActor
    var apiClient: Factory<APIClient> {
        Factory(self) { APIClientImpl() }
    }
}

// MARK: - Injecting Repositories
extension Container {
    @MainActor
    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepositoryImpl(client: self.apiClient()) }
    }
    
    @MainActor
    var accountRepository: Factory<AccountRepository> {
        Factory(self) { AccountRepositoryImpl(client: self.apiClient()) }
    }
    
    @MainActor
    var movieRepository: Factory<MovieRepository> {
        Factory(self) {
            MovieRepositoryImpl(client: self.apiClient())
        }
    }
    
    @MainActor
    var castRepository: Factory<CastRepository> {
        Factory(self) {
            CastRepositoryImpl(client: self.apiClient())
        }
    }
    
}

// MARK: - Injecting Validator
extension Container {
    @MainActor
    var loginValidator: Factory<LoginValidating> {
        Factory(self) {
            LoginValidator()
        }
    }
}

// MARK: UseCase
extension Container {
    @MainActor
    var loginUseCase: Factory<LoginUseCaseProtocol>{
        Factory(self) {
            LoginUseCase(
                authRepository: self.authRepository(), accountRepository: self.accountRepository(), validator: self.loginValidator()
            )
        }
    }
    
    @MainActor
    var getMovieListUseCase: Factory<GetMovieListUseCase>{
        Factory(self) {
            GetMovieListUseCaseImpl(repository: self.movieRepository())
        }
    }
    
    @MainActor
    var getMovieDetailUseCase: Factory<MoviesDetailsUseCase>{
        Factory(self) {
            MoviesDetailsUseCaseImpl(repository: self.movieRepository())
        }
    }
    
    @MainActor
    var getMovieCastUseCase: Factory<MovieCastUseCase>{
        Factory(self) {
            MovieCastUseCaseImpl(repository: self.movieRepository())
        }
    }
    
    @MainActor
    var getCastDetailUseCase: Factory<CastDetailUseCase>{
        Factory(self) {
            CastDetailUseCaseImpl(repository: self.castRepository())
        }
    }
    
    @MainActor
    var getMovieSearchUseCase: Factory<GetMovieSearchUseCase>{
        Factory(self) {
            GetMovieSearchUseCaseImpl(repository: self.movieRepository())
        }
    }
}

// MARK: ViewModel
extension Container {
    @MainActor
    var loginViewModel: Factory<LoginViewModel> {
        Factory(self) {
            LoginViewModel(loginUseCase: self.loginUseCase())
        }
    }
    
    @MainActor
    var popularMovieViewModel: Factory<MovieListViewModel>{
        Factory(self) {
            MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase())
        }
    }
    
    @MainActor
    var topRatedMovieViewModel: Factory<MovieListViewModel>{
        Factory(self) {
            MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase())
        }
    }
    
    @MainActor
    var upcomingMovieViewModel: Factory<MovieListViewModel>{
        Factory(self) {
            MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase())
        }
    }
    
    @MainActor
    var romanceMovieViewModel: Factory<MovieListViewModel>{
        Factory(self) {
            MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase())
        }
    }
    
    @MainActor
    var actionMovieViewModel: Factory<MovieListViewModel>{
        Factory(self) {
            MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase())
        }
    }
    
    @MainActor
    var thrillerMovieViewModel: Factory<MovieListViewModel>{
        Factory(self) {
            MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase())
        }
    }
    
    @MainActor
    var movieDetailViewModel: Factory<MovieDetailViewModel>{
        Factory(self) {
            MovieDetailViewModel(moviesDetailsUseCase: self.getMovieDetailUseCase())
        }
    }
    
    @MainActor
    var movieCastViewModel: Factory<MovieCastViewModel>{
        Factory(self) {
            MovieCastViewModel(getMovieCastUseCase: self.getMovieCastUseCase())
        }
    }
    
    @MainActor
    var castDetailViewModel: Factory<CastDetailViewModel>{
        Factory(self) {
            CastDetailViewModel(getCastDetailUseCase: self.getCastDetailUseCase())
        }
    }
    
    @MainActor
    var searchViewModel: Factory<SearchViewModel>{
        Factory(self) {
            SearchViewModel(getMovieSearchUseCase: self.getMovieSearchUseCase())
        }
    }
    
    @MainActor
    var favoriteViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(getMovieListUseCase: self.getMovieListUseCase()) }
    }
}
