# Rick and Morty App - UIKit (MVVM-C)

Este projeto foi desenvolvido como parte de um teste técnico para a empresa **Afya**. O objetivo é construir um app iOS em Swift que consuma a [API pública de Rick and Morty](https://rickandmortyapi.com/) e exiba informações de **personagens** e **episódios**, com paginação, tema escuro e navegação por abas.

## 📱 Funcionalidades

- [x] Listagem de personagens com paginação
- [x] Detalhes de personagens
- [x] Listagem de episódios com paginação
- [x] Detalhes de episódios
- [x] Navegação via tab bar
- [x] Arquitetura MVVM-C (Model-View-ViewModel-Coordinator)
- [x] Layout 100% programático em UIKit
- [x] Modo escuro (Dark Theme)
- [x] Consumo de API assíncrono

## 🧱 Arquitetura

O projeto segue a arquitetura **MVVM-C**, promovendo a separação de responsabilidades entre:

- `Model`: Estruturas que representam os dados da API
- `ViewModel`: Responsável por lidar com a lógica de negócio e requisições de rede
- `ViewController`: Responsável por exibir os dados ao usuário
- `Coordinator`: Gerencia a navegação entre telas

```
AppCoordinator
├── CharactersCoordinator
│   └── CharactersViewController
│       └── CharactersViewModel
├── EpisodesCoordinator
    └── EpisodesViewController
        └── EpisodesViewModel
```

## 🧰 Tecnologias

- Swift 5
- UIKit
- URLSession (para requisições HTTP)
- Xcode 15+

## 🚀 Como rodar o projeto

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/RickAndMortyApp.git
   ```

2. Abra o projeto no Xcode:
   ```bash
   open RickAndMortyApp.xcodeproj
   ```

3. Compile e rode no simulador (⌘R)

## 🔍 Considerações

- O layout é simples e funcional, com foco nas imagens dos personagens.
- O projeto foi escrito para facilitar manutenção e escalabilidade.
- Todos os componentes são programáticos (sem storyboard).

---

Feito com 💚 para o desafio técnico da **Afya**.
