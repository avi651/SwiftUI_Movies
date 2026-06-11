//
//  LoginView.swift
//  TMDB
//
//  Created by AVINASH on 28/05/26.
//

import SwiftUI
import FactoryKit

struct LoginView: View {

    enum LoginField: Hashable {
        case username
        case password
    }

    @State private var username = ""
    @State private var password = ""

    @State private var showAlert = false
    @State private var errorMessage = ""

    @EnvironmentObject private var session: SessionManager

    @StateObject
    private var loginViewModel = Container.shared.loginViewModel()

    @FocusState
    private var focusField: LoginField?

    var body: some View {
        ZStack {

            Color("Background")
                .ignoresSafeArea()

            VStack(spacing: 50) {

                Image(.tmdbLogo)

                VStack(spacing: 20) {

                    usernameField

                    passwordField

                    SubmitButton(
                        title: "Sign In",
                        isLoading: loginViewModel.isLoading,
                        onTap: loginUser
                    )

                    signupSection
                }
            }
            .padding(.horizontal)
        }
        .alert(
            "Login Failed",
            isPresented: $showAlert
        ) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
        .onChange(of: loginViewModel.state) { _, state in

            switch state {

            case .success(let user):

                withAnimation {
                    print("Username: \(user.name)")
                    session.signIn(user: user)
                }

            case .failure(let message):

                errorMessage = message
                showAlert = true

            default:
                break
            }
        }
    }
}

// MARK: - Components

private extension LoginView {

    var usernameField: some View {
        HStack(spacing: 20) {

            Image(systemName: "person.fill")

            TextField(
                "Username",
                text: $username
            )
            .accessibilityIdentifier("UsernameField")
            .focused(
                $focusField,
                equals: .username
            )
            .submitLabel(.next)
            .onSubmit {
                focusField = .password
            }
        }
        .decoratedField()
    }

    var passwordField: some View {
        HStack(spacing: 20) {

            Image(systemName: "lock.fill")

            SecureField(
                "Password",
                text: $password
            )
            .accessibilityIdentifier("PasswordField")
            .focused(
                $focusField,
                equals: .password
            )
            .submitLabel(.done)
            .onSubmit {
                loginUser()
            }
        }
        .decoratedField()
    }

    var signupSection: some View {
        HStack {

            Text("Don't have an account?")

            Link(
                "Sign Up",
                destination: URL(
                    string: "https://www.themoviedb.org/signup"
                )!
            )
        }
    }
}

// MARK: - Actions

private extension LoginView {

    func loginUser() {

        focusField = nil

        Task {
            await loginViewModel.login(
                username: username,
                password: password
            )
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(
            SessionManager()
        )
}
