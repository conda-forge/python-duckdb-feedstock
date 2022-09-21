import duckdb


def main():
    # Test that we can resolve extensions shipped by the duckdb team
    con = duckdb.connect()
    con.install_extension("sqlite_scanner")


if __name__ == "__main__":
    main()
