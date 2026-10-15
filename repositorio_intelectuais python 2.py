import mysql.connector


DB_CONFIG = {
    "host": "127.0.0.1",
    "port": 3306,
    "user": "root",
    "password": "",
    "database": "repositorio_intelectuais"
}


def conectar():
    return mysql.connector.connect(**DB_CONFIG)


def pesquisar_intelectual(conn):
    nome = input("\nDigite o nome do intelectual: ")

    sql = """
        SELECT i.id, i.nome, i.ano_nascimento, i.area,
               GROUP_CONCAT(DISTINCT g.nome SEPARATOR ', ') AS grupos
        FROM intelectuais i
        LEFT JOIN intelectual_grupo ig ON ig.intelectual_id = i.id
        LEFT JOIN grupos g ON g.id = ig.grupo_id
        WHERE i.nome LIKE %s
        GROUP BY i.id, i.nome, i.ano_nascimento, i.area
        ORDER BY i.id ASC
    """

    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql, (f"%{nome}%",))
    resultados = cursor.fetchall()
    cursor.close()

    if not resultados:
        print("\nNenhum intelectual encontrado.")
    else:
        print()
        for pessoa in resultados:
            print(f"ID: {pessoa['id']}")
            print(f"Nome: {pessoa['nome']}")
            print(f"Ano de nascimento: {pessoa['ano_nascimento']}")
            print(f"Área: {pessoa['area']}")
            print(f"Grupo(s): {pessoa['grupos'] or 'Não informado'}")
            print("-" * 70)

    input("\nPressione Enter para continuar...")


def listar_todos(conn):
    sql = """
        SELECT i.id, i.nome, i.ano_nascimento, i.area
        FROM intelectuais i
        ORDER BY i.id ASC
    """

    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql)
    resultados = cursor.fetchall()
    cursor.close()

    if not resultados:
        print("\nNenhum intelectual cadastrado.")
    else:
        print()
        for pessoa in resultados:
            print(f"ID: {pessoa['id']}")
            print(f"Nome: {pessoa['nome']}")
            print(f"Ano de nascimento: {pessoa['ano_nascimento']}")
            print(f"Área: {pessoa['area']}")
            print("-" * 70)

    input("\nPressione Enter para continuar...")


def filtrar_grupo(conn):
    print("\nGrupos disponíveis:")

    sql_grupos = """
        SELECT id, nome
        FROM grupos
        ORDER BY id ASC
    """

    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql_grupos)
    grupos = cursor.fetchall()

    for grupo in grupos:
        print(f"{grupo['id']} - {grupo['nome']}")

    grupo_id = input("\nDigite o ID do grupo: ")

    sql = """
        SELECT DISTINCT i.id, i.nome, i.ano_nascimento, i.area
        FROM intelectuais i
        INNER JOIN intelectual_grupo ig
            ON ig.intelectual_id = i.id
        INNER JOIN grupos g
            ON g.id = ig.grupo_id
        WHERE g.id = %s
        ORDER BY i.id ASC
    """

    cursor.execute(sql, (grupo_id,))
    resultados = cursor.fetchall()
    cursor.close()

    if not resultados:
        print("\nNenhum intelectual encontrado nesse grupo.")
    else:
        print()
        for pessoa in resultados:
            print(f"ID: {pessoa['id']}")
            print(f"Nome: {pessoa['nome']}")
            print(f"Ano de nascimento: {pessoa['ano_nascimento']}")
            print(f"Área: {pessoa['area']}")
            print("-" * 70)

    input("\nPressione Enter para continuar...")


def filtrar_area(conn):
    print("\nÁreas disponíveis:")

    sql_areas = """
        SELECT id, nome
        FROM areas
        ORDER BY id ASC
    """

    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql_areas)
    areas = cursor.fetchall()

    for area in areas:
        print(f"{area['id']} - {area['nome']}")

    area_id = input("\nDigite o ID da área: ")

    sql = """
        SELECT i.id, i.nome, i.ano_nascimento, a.nome AS area
        FROM intelectuais i
        INNER JOIN areas a
            ON a.id = i.area_id
        WHERE a.id = %s
        ORDER BY i.id ASC
    """

    cursor.execute(sql, (area_id,))
    resultados = cursor.fetchall()
    cursor.close()

    if not resultados:
        print("\nNenhum intelectual encontrado nessa área.")
    else:
        print()
        for pessoa in resultados:
            print(f"ID: {pessoa['id']}")
            print(f"Nome: {pessoa['nome']}")
            print(f"Ano de nascimento: {pessoa['ano_nascimento']}")
            print(f"Área: {pessoa['area']}")
            print("-" * 70)

    input("\nPressione Enter para continuar...")


def visualizar_obras(conn):
    sql = """
        SELECT i.id, i.nome, o.titulo, o.decada, o.link
        FROM intelectuais i
        JOIN obras o ON o.intelectual_id = i.id
        ORDER BY i.id ASC
    """

    cursor = conn.cursor(dictionary=True)
    cursor.execute(sql)
    resultados = cursor.fetchall()
    cursor.close()

    if not resultados:
        print("\nNenhuma obra encontrada.")
    else:
        print()

        for obra in resultados:
            print(f"ID: {obra['id']}")
            print(f"Autor: {obra['nome']}")
            print(f"Obra/Artigo: {obra['titulo']}")
            print(f"Década: {obra['decada'] or 'Não informado'}")
            print(f"Link/Referência: {obra['link'] or 'Não informado'}")
            print("-" * 70)

    input("\nPressione Enter para continuar...")


def cadastrar_intelectual(conn):
    print("\n=== CADASTRAR INTELECTUAL ===")

    nome = input("Nome: ")
    ano_nascimento = input("Ano de nascimento: ")
    area_id = input("ID da área: ")

    sql = """
        INSERT INTO intelectuais (nome, ano_nascimento, area_id)
        VALUES (%s, %s, %s)
    """

    cursor = conn.cursor()

    try:
        cursor.execute(
            sql,
            (
                nome,
                ano_nascimento if ano_nascimento else None,
                area_id
            )
        )

        intelectual_id = cursor.lastrowid

        conn.commit()

        print("\nIntelectual cadastrado com sucesso!")
        print(f"ID gerado: {intelectual_id}")

    except mysql.connector.Error as erro:
        conn.rollback()
        print(f"\nErro ao cadastrar intelectual: {erro}")

    finally:
        cursor.close()

    input("\nPressione Enter para continuar...")


def menu():
    try:
        conn = conectar()
        print("Conectado ao banco de dados com sucesso!")

    except mysql.connector.Error as erro:
        print("Erro ao conectar ao banco de dados:")
        print(erro)
        return

    while True:
        print("\n" + "=" * 70)
        print("        REPOSITÓRIO DE INTELECTUAIS")
        print("=" * 70)

        print("1 - Pesquisar intelectual")
        print("2 - Listar todos")
        print("3 - Filtrar por grupo minoritário")
        print("4 - Filtrar por área")
        print("5 - Visualizar obras e links")
        print("6 - Cadastrar intelectual")
        print("0 - Sair")

        opcao = input("\nEscolha uma opção: ")

        if opcao == "1":
            pesquisar_intelectual(conn)

        elif opcao == "2":
            listar_todos(conn)

        elif opcao == "3":
            filtrar_grupo(conn)

        elif opcao == "4":
            filtrar_area(conn)

        elif opcao == "5":
            visualizar_obras(conn)

        elif opcao == "6":
            cadastrar_intelectual(conn)

        elif opcao == "0":
            print("\nPrograma encerrado.")
            break

        else:
            print("\nOpção inválida!")

    conn.close()


if __name__ == "__main__":
    menu()