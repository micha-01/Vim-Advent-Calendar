from datetime import datetime
from pathlib import Path
ROOT: Path = Path(__file__).parent.absolute()


def get_passwords() -> dict:
    passwords: dict = {}
    password_file: str = 'passwords.txt'
    with open(ROOT.joinpath(password_file).as_posix()) as f:
        for i in range(24):
            passwords[i + 1] = f.readline().split(" ")[-1].replace('\n', '')
    return passwords


def find_day() -> int:
    return datetime.now().date().day


def write_pw_file(today: int, password: str, file: str):
    with open(ROOT.joinpath(file).as_posix(), 'a') as f:
        f.write(f"{today}. {password}")


def main():
    passwords: dict = get_passwords()
    today: int = find_day()
    readme: str = 'README.md'
    passwords_file: str = 'passwords.md'
    write_pw_file(today, passwords[today], readme)
    write_pw_file(today, passwords[today], passwords_file)


if __name__ == "__main__":
    main()
