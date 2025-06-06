# desafio_liderate

Desafio técnico em Flutter para a Liderate

App de Agendamentos com Upload de Imagens
Este projeto Flutter permite ao usuário cadastrar agendamentos com título, descrição, data, hora e uma ou mais imagens. O app utiliza arquitetura em camadas (domain, presentation, data) e o estado é gerenciado com o Provider.

Funcionalidades
Criar novo agendamento com:
Título
Descrição
Data e Hora
Múltiplas imagens (galeria)
Visualização dos agendamentos em uma lista com imagem, título e descrição
Salvamento local em memória

Como Rodar o Projeto
1. Pré-requisitos
Flutter SDK
Dispositivo físico ou emulador Android/iOS configurado

2. Clonar o repositório
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio

3. Instalar dependências
flutter pub get

4. Executar o app
flutter run

 
Estrutura do Projeto

lib/
├── core/
│   └── widgets/           → componentes reutilizáveis
├── features/
│   └── agendamento_post/
│       ├── data/          → repositórios e fontes de dados
│       ├── domain/        → entidades (modelos)
│       ├── presentation/  → telas, widgets e estado
│       │   ├── pages/
│       │   ├── state/
│       │   └── widgets/
└── main.dart

Pacotes Utilizados
provider – Gerenciamento de estado
uuid – Geração de IDs únicos
intl – Formatação de datas
image_picker – Seleção de imagens da galeria


Autor
Desenvolvido por Maryangela Soares
