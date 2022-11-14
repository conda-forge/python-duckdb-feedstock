import platform
import duckdb


def main():
    # Test that we can resolve extensions shipped by the duckdb team
    con = duckdb.connect()
    con.install_extension("postgres_scanner")


if __name__ == "__main__":
    # The mac arm builds sometimes lag releases -- this test is not a
    # completeness test for extension resolution, just a test that we've
    # correctly constructed the extension URL, so succeeding only on Linux is a
    # sufficient check.
    if platform.system() == "Linux":
        main()
