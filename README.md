# desafio_liderate

Desafio técnico em Flutter para a Liderate

---

## 📱 App de Agendamentos com Upload de Imagens

Este projeto Flutter permite ao usuário cadastrar agendamentos com título, descrição, data, hora e uma ou mais imagens.  
O app utiliza arquitetura em camadas (**domain**, **presentation**, **data**) e o estado é gerenciado com o **Provider**.

---

## ✨ Funcionalidades

- Criar novo agendamento com:
  - Título
  - Descrição
  - Data e Hora
  - Múltiplas imagens (seleção da galeria)
- Visualização dos agendamentos em uma lista com:
  - Imagem
  - Título
  - Descrição
- Salvamento local em memória

---

##  Como Rodar o Projeto

###  Pré-requisitos

- Flutter SDK instalado
- Dispositivo físico ou emulador Android/iOS configurado

###  Clonar o repositório

```bash
git clone https://github.com/marysoarez/desafio_liderate.git
cd desafio_liderate
```

###  Instalar dependências

```bash
flutter pub get
```

### ▶ Executar o app

```bash
flutter run
```

---

##  Estrutura do Projeto

```
lib/
├── core/
│   └── widgets/            # Componentes reutilizáveis
├── features/
│   └── agendamento_post/
│       ├── data/           # Repositórios e fontes de dados
│       ├── domain/         # Entidades (modelos)
│       ├── presentation/   # Telas, widgets e estado
│           ├── pages/
│           ├── state/
│           └── widgets/
└── main.dart
```

---

##  Pacotes Utilizados

- `provider` – Gerenciamento de estado
- `uuid` – Geração de IDs únicos
- `intl` – Formatação de datas
- `image_picker` – Seleção de imagens da galeria

---

##  Autor

Desenvolvido por **Maryangela Soares**
