import 'package:flutter/material.dart';
import 'tela_post.dart';

class NoticiasTecnologia extends StatelessWidget {
  final List<Map<String, String>> noticias = [
    {
      "titulo": "Experiência com Flutter após 6 meses",
      "conteudo":
          "Relato completo de um desenvolvedor sobre os prós e contras do Flutter após meio ano de uso prático em diversos projetos, incluindo apps para Android e iOS, além de Flutter Web. Aprendizados, desafios e dicas importantes para quem está começando.",
    },
    {
      "titulo": "Como eu estudei para o Github Foundations",
      "conteudo":
          "Compartilho minha estratégia de estudos e recursos que usei para me preparar para o exame Github Foundations, incluindo cursos online, práticas de Git, e exemplos reais de uso em projetos colaborativos.",
    },
    {
      "titulo": "Dica para melhorar produtividade no VSCode",
      "conteudo":
          "Uma das dicas mais valiosas que encontrei foi usar extensões como o Live Share e o CodeSnap, além de atalhos personalizados para acelerar o desenvolvimento e depuração de código.",
    },
    {
      "titulo": "Debate: React vs Angular em 2025",
      "conteudo":
          "Análise profunda sobre as vantagens, desvantagens e tendências de uso das frameworks React e Angular em 2025, com opiniões de especialistas e dados recentes do mercado.",
    },
    {
      "titulo": "Problemas comuns em deploy de apps Flutter web",
      "conteudo":
          "Discussão sobre os principais desafios que os desenvolvedores enfrentam ao fazer deploy de apps Flutter na web, incluindo configuração de servidores, problemas de cache e performance.",
    },
    {
      "titulo": "Melhor linguagem para backend em 2025",
      "conteudo":
          "Comparativo das linguagens mais promissoras para desenvolvimento backend, incluindo Node.js, Go, Rust e Kotlin, com base em performance, comunidade e facilidade de aprendizado.",
    },
    {
      "titulo": "Indicação de livro: Clean Code",
      "conteudo":
          "Resenha do livro Clean Code, explicando por que é leitura essencial para todo desenvolvedor que quer escrever código limpo, legível e sustentável.",
    },
    {
      "titulo": "Curso de segurança cibernética para devs",
      "conteudo":
          "Recomendações de cursos online para desenvolvedores que querem aprofundar seus conhecimentos em segurança cibernética, incluindo tópicos como criptografia, ataques comuns e melhores práticas.",
    },
    {
      "titulo": "Experiência com Docker em projetos pequenos",
      "conteudo":
          "Como usar Docker para facilitar o desenvolvimento e deployment de projetos pequenos, com exemplos práticos de configuração e dicas para evitar erros comuns.",
    },
    {
      "titulo": "Melhores sites para aprender programação grátis",
      "conteudo":
          "Lista atualizada dos melhores sites para aprender programação sem custo, incluindo plataformas com cursos, tutoriais e exercícios práticos para diferentes níveis.",
    },
  ];

  final Function(Map<String, String>)? onPostTap;

  NoticiasTecnologia({this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        final noticia = noticias[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Icon(Icons.article, color: Colors.blue),
            title: Text(noticia["titulo"]!),
            subtitle: Text(
              noticia["conteudo"]!.length > 100
                  ? noticia["conteudo"]!.substring(0, 100) + "..."
                  : noticia["conteudo"]!,
            ),
            onTap: () {
              if (onPostTap != null) {
                onPostTap!(noticia);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TelaPost(
                      titulo: noticia["titulo"]!,
                      conteudo: noticia["conteudo"]!,
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
