# 📁 Nginx File Browser - Alpine Linux & FancyIndex

Um servidor de arquivos estáticos incrivelmente leve, rápido e com um visual moderno e responsivo. Construído com **Alpine Linux**, **Nginx** e o módulo **ngx-fancyindex**.

Este projeto transforma a listagem de diretórios padrão e sem graça do Nginx em uma interface de usuário rica, interativa e elegante, com recursos de busca em tempo real e ordenação no lado do cliente.

---

## ✨ Principais Recursos

- **Interface Dark Mode Minimalista:** Design moderno focado na usabilidade, com tipografia limpa e paleta de cores escuras de alto contraste.
- **Leve e Rápido:** Baseado na imagem oficial do Alpine Linux, garantindo um contêiner minúsculo e seguro.
- **Busca em Tempo Real:** Filtre arquivos e pastas instantaneamente através de um campo de busca responsivo (via JavaScript puro, sem necessidade de processamento no servidor).
- **Ordenação Dinâmica:** Clique nos cabeçalhos da tabela (Nome, Tamanho, Data) para ordenar os arquivos de forma crescente ou decrescente sem recarregar a página (Case-Insensitive e com parsing inteligente de tamanhos e datas).
- **Ícones SVG Nativos:** Utilização de ícones vetoriais embutidos para identificar pastas, arquivos e a opção de retornar ao diretório pai, sem depender de bibliotecas externas (como FontAwesome) ou imagens pesadas.
- **100% Responsivo:** O layout se adapta perfeitamente a dispositivos móveis. Em telas menores, a tabela ganha rolagem horizontal para evitar a quebra do layout.
- **Isolamento de Tema:** Os arquivos do tema (`header.html` e `footer.html`) residem em um diretório seguro (`/usr/share/nginx/theme/`) dentro do contêiner, permitindo que você mapeie seus volumes de arquivos livremente para `/var/www/html` sem sobrescrever o design.

---

## 📂 Estrutura de Arquivos do Repositório

```text
.
├── docker-compose.yml    # Orquestração do contêiner Docker
├── Dockerfile            # Receita de construção da imagem baseada em Alpine
├── default.conf          # Configuração do Nginx (Virtual Host e FancyIndex)
└── theme/                # Diretório contendo a interface customizada
    ├── header.html       # Cabeçalho, CSS (Dark Mode), Ícones SVG e lógicas JS (Busca e Ordenação)
    └── footer.html       # Rodapé estático com créditos
```

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
Certifique-se de ter o [Docker](https://docs.docker.com/get-docker/) e o [Docker Compose](https://docs.docker.com/compose/install/) instalados na sua máquina.

### Passo a Passo

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/AprendendoLinux/nginx.git](https://github.com/AprendendoLinux/nginx.git)
   cd nginx
   ```

2. **Ajuste o mapeamento do volume (Opcional):**
   Por padrão, o `docker-compose.yml` cria um volume nomeado. Se você quiser servir uma pasta específica do seu computador, edite a linha do `volumes` no `docker-compose.yml`:
   ```yaml
   volumes:
     - /caminho/para/sua/pasta/local:/var/www/html
   ```

3. **Construa a imagem e suba o contêiner:**
   ```bash
   docker-compose build --no-cache
   docker-compose up -d
   ```

4. **Acesse no navegador:**
   Abra `http://localhost` (ou o IP do seu servidor) no seu navegador favorito.

---

## 🛠️ Personalização

Se você deseja alterar cores, textos ou o rodapé, é muito simples:

- **Estilos e Lógica:** Edite o arquivo `theme/header.html`. Nele, você encontrará as variáveis CSS (`:root`) logo no início da tag `<style>`, onde é possível mudar as cores primárias, background e detalhes de destaque (accent). O Javascript responsável pela busca e ordenação encontra-se no final do arquivo.
- **Rodapé:** Edite o arquivo `theme/footer.html` para alterar o texto de copyright ou links.

**Importante:** Sempre que alterar os arquivos dentro da pasta `theme/`, você precisará reconstruir a imagem do Docker para que as alterações entrem em vigor:
```bash
docker-compose build
docker-compose up -d
```

---

## 👨‍💻 Créditos

Desenvolvido e customizado por **[Henrique Fagundes](https://henrique.tec.br)**.