import datetime
import html
import locale
import shutil
from pathlib import Path

locale.setlocale(locale.LC_ALL, "en_US.UTF-8")


def copy_static_files(static_dir: Path, dist_dir: Path):
    for file in static_dir.rglob("*"):
        shutil.copy2(file, dist_dir)


BASE_DIR = Path(__file__).parent
PARTIALS_DIR = BASE_DIR / "partials"
STATIC_DIR = BASE_DIR / "static"
DIST_DIR = BASE_DIR / "dist"

DIST_DIR.mkdir(exist_ok=True)

BASE_PARTIAL = (PARTIALS_DIR / "base.html").read_text()
HEADER_PARTIAL = (PARTIALS_DIR / "header.html").read_text()
SOLUTION_PARTIAL = (PARTIALS_DIR / "solution.html").read_text()
FOOTER_PARTIAL = (PARTIALS_DIR / "footer.html").read_text()
TOC_PARTIAL = (PARTIALS_DIR / "toc.html").read_text()

solutions = sorted(list(BASE_DIR.glob("*day*")))

content = []
toc = []

for solution in solutions:
    solution_name = solution.name.replace("-", " - ").title()
    print(f"Building page for {solution_name}")

    solution_file = next(solution.glob("solution.*"))
    solution_text = solution_file.read_text().strip()
    tool_version = (solution / "version").read_text()
    solution_output = (solution / "output").read_text()

    content.append(
        SOLUTION_PARTIAL.format(
            id=solution.name,
            solution_name=solution_name,
            solution_text=html.escape(solution_text),
            solution_output=f"{tool_version}\n{solution_output}",
        )
    )

    toc.append(
        TOC_PARTIAL.format(
            id=solution.name,
            name=solution.name.split('-')[1].title()
        )
    )

footer = FOOTER_PARTIAL.format(
    updated_date=datetime.datetime.now(datetime.timezone.utc).strftime(
        "%a, %d/%m/%Y (%H:%M:%S %Z)"
    )
)

complete_page = BASE_PARTIAL.format(
    header=HEADER_PARTIAL.format(toc="".join(toc)), content="".join(content), footer=footer
)

(DIST_DIR / "index.html").write_text(complete_page)

copy_static_files(STATIC_DIR, DIST_DIR)
