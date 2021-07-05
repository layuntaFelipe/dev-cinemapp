# CinemaApp

## App desenvolvido para o desafio da Sthima

O desafio da Sthima consistia em desenvolver um aplicativo moblie, no meu caso IOS(escolhi utilizar a nova framework da Apple: SwiftUI pra fazer esse projeto) que utilizaria da API OMDB para popular o aplicativo com seus filmes.
O desafio consistia em 5 principais objetivos:

1. Permitir busca por filmes
2. Listar os filmes encontrados
3. Permitir que escolhamos nosso filme favorito
4. Listar filmes favoritos
5. Permitir que removamos filmes favoritados

## Desenvolvimento do App
<p>Primeiramente entendi como a OMDB API funcionava, depois criei estruturas que seriam responsaveis por receber os dados diretos da API, logo depois criai um objeto (networkManager) que seria responsavel pelo networking entre o App e a API;</p>
<p>Apos esse trabalho criei os modelos que receberiam os dados das estruturas para que assim possa passar para as Views</p>
<p>Feito isso, o networking e os dados da API estavam resolvidos, agora seria comecar a construir as Views do App, nessa etapa desidi deixar o app bem simple consistindo apenas de duas Views, onde a segunda(DetailView) sobrepoe a primeira(Contentview)</p>
<p>ContentView: Essa Veiw consiste de outras 5 SubViews: </p>

1. A Header com a apresentacao e a logo;
2. A SearchView com a searchBar para escrever o nome do filme e um botao de lupa para concluir a pesquisa;
3. A ScrollView que e responsavel por apresentar de forma horizontal os resultados da pesquisa
4. Um simples Text para dividir os filmes pesquisados dos favoritos
5. Um grid com os filmes favoritos

### Funcionamento do App
Primeiramente abrit o projeto no XCode, depois escolher o despositivo que deseja rodar o simulador, eu sujiro em um despositivo fisico pois implementei alguns features que dao feedback ao usuario que nao é possivle perceber no simulador.

Ao abrir o app, va para a barra de pesquisa, pesquise por um filme, terminar de pesquisar/clicar no butao de return ou na lupa, o texto escrito na searchBar é entao passado para o networkManager que é o objeto responsavel pelo networking do app com a API, ele entao faz o request para a API por meio de uma funcao com o texto passado pela search bar, e popula as estruturas responsaveis por resgatar os dados

Depois disso, devido os dados responsaveis por resgatar os dados estarem agora com dados da api, a Scrollview faz um looping por todos os filmes resgatados que entao foram colocados em um vetor, cada item do vetor é um filme, contendo uma ID, PosterURL e outros; por meio de uma extensao do tipo String eu fui capaz de criar uma funcao que carregaria a imagem do poster apenas passando seu URL, essa imagem entao foi colocada em um botao, formando assim um scroll horizontal de posters dos filmes pesquisados;

Ao clicar em um dos posters dos filmes pesquisados, a DetailView sobrepoe a ContentView, mostrando detalhes do filme, como: duracao, lancamento, nota, titulo, direcao, atores, uma breve descricao, e um botao em formato de estrela.

O botao em formato de estrela tem a funcao de colocar o filme como favorito, ao clicar no botao e a estrela ficar amarela, a ID do filme, junto com a seu posterURL sao adicionados ao vetor de filmes favoritos, que quando o usuario volta a tela principal sera carregada em um grid de filmes favoritos.

Nesse grid, se o usuario desejar remover um item da lista de favoritos, basta clicar no filme na lista de favoritos e clicar na estrela para que fique apagada e entao apague da lista de favoritos esse filme;
