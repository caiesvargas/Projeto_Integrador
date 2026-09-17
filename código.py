"""
Projeto escolar: Repositório de Intelectuais

Etapa 1: estrutura inicial do programa.
O sistema funciona somente por texto no terminal.
"""

# Lista que armazenará os intelectuais cadastrados no repositório.
# Cada intelectual é representado por um dicionário.
# A chave "artigos" contém uma lista, pois um autor poderá ter vários artigos.

intelectuais = [
    {
        "id": 1,
        "autor": "Intelectual Exemplo",
        "registro_ficticio": True,
        "ano_nascimento": 1900,
        "ano_falecimento": None,
        "seculo": "XX",
        "grupos": ["Grupo de exemplo"],
        "biografia": (
            "Registro totalmente fictício, usado somente para demonstrar "
            "a organização dos dados do projeto."
        ),
        "artigos": [
            {
                "titulo": "Artigo de exemplo",
                "resumo": "Resumo fictício usado apenas para testar a estrutura.",
                "palavras_chave": ["exemplo", "teste"],
                "link": "https://example.com",
            }
        ],
    }
]


def exibir_cabecalho():
    """Mostra o título do projeto no terminal."""
    print("\n_______________________________")
    print("REPOSITÓRIO DE INTELECTUAIS")
    print("_______________________________")
    print("Produções de grupos historicamente marginalizados")


def exibir_menu_principal():
    """Mostra as opções disponíveis e devolve a escolha do usuário."""
    print("\n_______________________________")
    print("MENU PRINCIPAL")
    print("_______________________________")
    print("1. Pesquisar no repositório (em breve)")
    print("2. Aplicar filtros (em breve)")
    print("3. Cadastrar intelectual (em breve)")
    print("4. Visualizar artigos e links (em breve)")
    print("0. Sair")
    print("_______________________________")

    return input("Digite uma opção: ").strip()


def informar_funcionalidade_futura():
    """Avisa que uma opção será desenvolvida em uma próxima etapa."""
    print("\nEsta funcionalidade será adicionada nas próximas etapas.")
    input("Pressione Enter para voltar ao menu...")


def executar_programa():
    """Controla o menu e mantém o programa aberto até o usuário sair."""
    exibir_cabecalho()

    while True:
        opcao = exibir_menu_principal()

        if opcao == "0":
            print("\nPrograma encerrado. Até a próxima!")
            break

        if opcao in {"1", "2", "3", "4"}:
            informar_funcionalidade_futura()
        else:
            print("\nOpção inválida. Digite um número mostrado no menu.")


# Este teste faz o programa iniciar apenas quando este arquivo for executado
# diretamente pelo terminal.

if __name__ == "__main__":
    executar_programa()
