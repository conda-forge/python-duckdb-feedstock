import duckdb


def main():
    # Test that we can resolve extensions shipped by the duckdb team
    con = duckdb.connect()
    con.install_extension("postgres_scanner")
    con.load_extension("postgres_scanner")


if __name__ == "__main__":
    main()
