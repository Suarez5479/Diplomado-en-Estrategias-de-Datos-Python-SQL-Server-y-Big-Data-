from pathlib import Path
import shutil


def main():
    base_path = Path(__file__).parent

    landing_path = base_path / "landing"
    bronze_path = base_path / "bronze"
    bad_data_path = base_path / "bad_data"

    for file_path in landing_path.iterdir():
        if not file_path.is_file():
            continue

        try:
            if file_path.stat().st_size > 0:
                shutil.move(
                    str(file_path),
                    bronze_path / file_path.name
                )
                print(f"Procesado: {file_path.name} -> Bronze")
            else:
                shutil.move(
                    str(file_path),
                    bad_data_path / file_path.name
                )
                print(f"Rechazado: {file_path.name} -> Bad Data")

        except Exception as e:
            print(f"Error procesando {file_path.name}: {e}")


if __name__ == "__main__":
    main()
