# Rick and Morty Flutter App

Aplicação Flutter que consome a API do Rick and Morty para listar personagens e exibir seus detalhes.

## 🚀 Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento
- **Dio** - Cliente HTTP para requisições
- **Flutter Bloc** - Gerenciamento de estado
- **GetIt + Injectable** - Injeção de dependência
- **GoRouter** - Navegação
- **JSON Serialization** - Serialização de dados

## 🏗️ Arquitetura

O projeto segue o padrão **MVVM (Model-View-ViewModel)**:

- **Model**: Entities e Repository
- **View**: Pages com BlocBuilder
- **ViewModel**: Cubits para gerenciamento de estado

### Estrutura do Projeto

```
lib/
├── core/
│   ├── di/
│   │   └── injection.dart
│   └── network/
│       └── http_client.dart
├── domain/
│   ├── entitiy/
│   │   └── character.dart
│   ├── enum/
│   │   └── character_status.dart
│   └── repository/
│       └── character_repository.dart
├── presentation/
│   ├── cubits/
│   │   ├── character_list_cubit.dart
│   │   └── character_details_cubit.dart
│   ├── pages/
│   │   ├── character_list.dart
│   │   └── character_details.dart
│   └── widgets/
│       ├── character_card.dart
│       └── error_message_widget.dart
└── routing/
    ├── app_routes.dart
    └── router.dart
```

## 🔧 Como Executar

### 1. Clone o repositório

```bash
https://github.com/okBraga/rick_and_morty_flutter.git
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Execute o build runner

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4. Execute o projeto

```bash
flutter run
```

## 📱 Funcionalidades

### Lista de Personagens
- Exibe grid de personagens da API
- Loading state durante carregamento
- Tratamento de erros
- Navegação para detalhes

### Detalhes do Personagem
- Exibe informações completas do personagem
- Status com cores diferenciadas
- Imagem do personagem
- Espécie do personagem

## 🎨 Design System

O projeto utiliza um design system próprio com:
- **Tokens**: Espaçamentos, cores e tipografia padronizados
- **Widgets reutilizáveis**: Cards e componentes customizados
- **Tema escuro**: Interface com tema dark

## 📦 Dependências Principais

```yaml
dependencies:
  flutter_bloc: ^9.1.1
  dio: ^5.9.0
  get_it: ^8.2.0
  injectable: ^2.5.1
  go_router: ^16.1.0
  equatable: ^2.0.5
  json_annotation: ^4.9.0

dev_dependencies:
  build_runner: ^2.6.0
  json_serializable: ^6.10.0
  injectable_generator: ^2.8.1
```

### Adapter Pattern
Implementado adapter para abstrair o Dio:

```dart
abstract class HttpClient {
  Future<Map<String, dynamic>> get(String url);
}
```




Este projeto foi desenvolvido como teste técnico.


Desenvolvido seguindo as melhores práticas de:
- ✅ Código legível e organizado
- ✅ Arquitetura MVVM
- ✅ Boa usabilidade e responsividade
- ✅ Adoção de boas práticas de desenvolvimento
- ✅ Padrão Adapter para abstração do Dio
- ✅ Injeção de dependência com GetIt
- ✅ Gerenciamento de estado com Cubit
