# Explore Brasil

Site acadêmico sobre turismo no Brasil, construído com HTML e CSS. São cinco páginas com menu compartilhado, imagens locais e layout que se adapta à largura da tela.

**Repositório do projeto:** [GabrielRFreitas/Trabalho-site](https://github.com/GabrielRFreitas/Trabalho-site).

## Abrir o site

Abra **index.html** no navegador. O projeto não precisa de instalação, banco de dados ou servidor para a visualização local.

| Página | Arquivo | Conteúdo |
| --- | --- | --- |
| Início | `index.html` | Apresentação do projeto e estilos de viagem |
| Destinos | `destinos.html` | Seis destinos nas categorias praia, serra e natureza |
| Roteiros | `roteiros.html` | Sugestões de viagens de três e cinco dias |
| Dicas | `dicas.html` | Planejamento, mala, passeios e cuidado com os lugares |
| Contato | `contato.html` | Formulário demonstrativo com validação nativa do HTML |

Os estilos estão em `style.css` e as fotografias em `imagens/`. A página inicial foi renomeada de `Viagens.html` para `index.html`, e todos os links internos foram atualizados.

## Mapa do site

![Mapa das cinco páginas e dos links internos](documentacao/mapa-do-site.png)

O menu de cada página permite acessar as outras quatro. O mapa também detalha os links dentro do conteúdo. O rodapé de todas as páginas possui um link externo para o portal Visit Brasil.

O PNG está pronto para inserir no relatório. Se a estrutura do site mudar, o mapa pode ser gerado novamente executando `documentacao/gerar-mapa.ps1` no PowerShell do Windows.

## 1. Conferir o site

- Abra `index.html` e visite as cinco páginas pelo menu.
- Confira se as três imagens carregam.
- Teste os cartões do início e os links entre categorias de Destinos e Roteiros.
- Reduza a largura da janela e confira o conteúdo no celular.
- No Contato, teste campos vazios, um e-mail inválido e, depois, dados fictícios válidos. O formulário é demonstrativo: os dados aparecem na URL, sem envio de mensagem ou armazenamento pelo projeto.

## 2. Enviar os arquivos ao GitHub

1. Entre na sua conta e abra [GabrielRFreitas/Trabalho-site](https://github.com/GabrielRFreitas/Trabalho-site), o repositório criado para este trabalho.
2. Use **Add file → Upload files** ou, se estiver vazio, o link **uploading an existing file** para enviar arquivos existentes.
3. Arraste os cinco HTML, `style.css`, `imagens/`, `README.md`, `LEIA-ME.txt`, `.gitignore` e `documentacao/`. Envie o conteúdo desta pasta do projeto, mantendo `index.html` na raiz do repositório e as fotos dentro de `imagens/`.
4. Escreva uma mensagem de commit, como `Adiciona site Explore Brasil`, e confirme o envio. Se optar por uma nova branch, conclua a incorporação ao repositório pela tela do GitHub.
5. Confira a lista de arquivos e use o endereço do repositório já registrado no modelo de relatório.

O ZIP de publicação é uma conveniência para o FTP. No GitHub, envie os arquivos do projeto individualmente e preserve as pastas.

Referências: [criar um repositório](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository) e [enviar arquivos](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository), na documentação do GitHub.

## 3. Publicar no servidor do professor

1. Reúna os dados fornecidos pelo professor: host, protocolo (FTP, FTPS ou SFTP), porta, usuário, senha, pasta de destino e URL pública do site. Use os valores informados, pois o endereço FTP e a URL do navegador podem ser diferentes.
2. No FileZilla Client, abra **Arquivo → Gerenciador de Sites**, crie uma entrada e preencha esses dados.
3. Conecte e abra, no lado remoto, a pasta indicada pelo professor.
4. Extraia `explore-brasil-ftp.zip`. No lado local, selecione o conteúdo extraído e envie para a pasta remota.
5. A organização no servidor deve ser:

   ```text
   pasta indicada pelo professor/
   ├── index.html
   ├── destinos.html
   ├── roteiros.html
   ├── dicas.html
   ├── contato.html
   ├── style.css
   └── imagens/
       ├── praia.jpg
       ├── montanha.jpg
       └── natureza.jpg
   ```

6. Aguarde as transferências terminarem e confira se há transferências com falha.
7. Abra a URL HTTP ou HTTPS indicada pelo professor. Teste o menu, as imagens, os links das categorias e o formulário com dados fictícios.
8. Guarde a URL funcionando para o relatório. Se o servidor não abrir a página inicial ao acessar a pasta, teste a mesma URL terminando em `/index.html` e confira a configuração com o professor.

O servidor recebe os arquivos extraídos. O pacote contém apenas os arquivos necessários para o site; a documentação fica disponível nesta pasta e pode acompanhar o repositório.

Referências: [Gerenciador de Sites](https://wiki.filezilla-project.org/Site_Manager) e [transferência de arquivos](https://wiki.filezilla-project.org/FileZilla_Client_Tutorial_(en)), na documentação do FileZilla.

## 4. Preparar o relatório

Use [documentacao/modelo-relatorio.md](documentacao/modelo-relatorio.md) como texto-base no Word. Preencha os campos entre colchetes, insira `documentacao/mapa-do-site.png` e acrescente os links do GitHub e do site publicado.

O relatório deve incluir os integrantes e matrículas, tema, finalidade de cada página, mapa, dificuldades reais e divisão efetiva das tarefas. Aplique as regras de formatação fornecidas pelo professor e salve em DOCX ou PDF. Confirme que nenhum campo `[preencher]` ficou pendente antes da entrega.

## Fotografias

As imagens são ilustrativas dos estilos de viagem e não representam necessariamente os destinos citados. Fontes registradas no projeto:

- [Praia](https://images.unsplash.com/photo-1519046904884-53103b34b206)
- [Montanha](https://images.unsplash.com/photo-1464822759023-fed622ff2c3b)
- [Natureza](https://images.unsplash.com/photo-1441974231531-c6227db76b6e)
