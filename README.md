# Korean data-protection enforcement, as CSV

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22722236.svg)](https://doi.org/10.5281/zenodo.22722236)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Four tables covering how Korea's personal data laws are actually enforced. They are built by
reading the underlying decisions and judgments — not the press releases — and are published
here as plain CSV so they can be cited, checked and reused.

The tables are maintained at **[datalaw.kr](https://datalaw.kr/)**, which is the source of
truth; this repository is a distribution copy.

| File | What it covers | Rows | Source page |
|---|---|---|---|
| `data/pipc-sanctions.csv` | Sanction decisions published by the Personal Information Protection Commission (PIPC) | 889 | [datalaw.kr/sanctions/](https://datalaw.kr/sanctions/) |
| `data/mediation-cases.csv` | Disputes resolved by the Personal Information Dispute Mediation Committee | 771 | [datalaw.kr/mediation/](https://datalaw.kr/mediation/) |
| `data/damages-judgments.csv` | Civil judgments awarding (or refusing) damages for data breaches | 34 | [datalaw.kr/damages/](https://datalaw.kr/damages/) |
| `data/law-timeline.csv` | Korean statutes and subordinate rules with future commencement dates | 26 | [datalaw.kr/timeline/](https://datalaw.kr/timeline/) |

Row counts are as of 11 September 2026. Column headings are in Korean; the source pages carry
the same tables with the same columns.

## Scope, and what these numbers are not

- **Published decisions only.** The sanctions table counts decisions the Commission has actually
  published on its board. It is a floor, not a census.
- **Many respondents are anonymised** by the Commission. This project does not try to identify
  them from other sources, so any count broken down by company is a lower bound.
- **Machine-extracted.** Everything except a few hand-classified columns is extracted
  programmatically from the original documents. Accuracy is not guaranteed. Before relying on any
  individual case, open the original — the last column of each table links to it.
- Figures from different layers (decisions whose full text is published vs. decisions known only
  from a press release) **are not added together.**

## File format

Every file is UTF-8 with a BOM, so Excel opens it directly. The **first line is a comment**
beginning with `#` that records the source URL, the collection date and the corrections address;
column headings are on the second line. When reading programmatically, skip it:

```python
import pandas as pd
df = pd.read_csv("data/pipc-sanctions.csv", comment="#")
```

Amounts are in Korean won, written with thousand separators. A blank amount does not mean zero —
it means the measure was non-monetary, or the Commission redacted the figure.

## Citing

The tables change as the collectors run. If you are writing something that has to stay checkable —
a paper, a report — cite a **dated snapshot** rather than the live file. Snapshots live at
`https://datalaw.kr/archive/<name>-YYYY-MM-DD.csv` and never change once published; each source
page lists them.

Suggested form:

> Hyunsub Lee (SEUM Law), *PIPC Sanctions Tracker*, https://datalaw.kr/sanctions/ (collected YYYY-MM-DD)

**For academic work, cite the DOI.** Each release of this repository is archived on Zenodo with a
version DOI, and a concept DOI resolves to the latest version. A DOI is a fixed, resolvable
identifier, which is what a footnote in a paper needs — a live URL is not.

> Lee, Hyunsub. *Korean data-protection enforcement datasets.* Version 2026.09.12. Zenodo.
> https://doi.org/10.5281/zenodo.22722237

Two DOIs exist and they do different jobs. Cite the **version DOI** above when your work has to
stay checkable — it resolves to this exact release and its contents never change. Use the
**concept DOI**, [10.5281/zenodo.22722236](https://doi.org/10.5281/zenodo.22722236), when you want
to point at whatever the latest version is.

Individual decisions have stable anchors built from the case number — decision 제2026-215-336호 is
at `https://datalaw.kr/sanctions/#d-2026-215-336`, and the same scheme applies to the other tables.

## Licence

The compilation is licensed **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)** — share
and adapt it for any purpose, including commercially, as long as you give credit. See `LICENSE`.

The underlying decisions, mediation cases and judgments are public documents of Korean state
bodies and are not subject to copyright under art. 7 of the Korean Copyright Act. The licence
covers the compilation, not the sources, which are free of copyright to begin with.

## Corrections

If a value is wrong, or a disposition has since been annulled or varied on appeal, write to
**hyunsub.lee@seumlaw.com**. Corrections are made once checked against the original document.

## Who maintains this

Hyunsub Lee, a Korean-qualified lawyer and partner at SEUM Law in Seoul. His practice covers
privacy, data and technology regulation. Background: [datalaw.kr/en/about/](https://datalaw.kr/en/about/).

---

## 한국어

개인정보 관련 제재·조정·판결·시행일 네 가지 표를 CSV로 배포합니다. 정본은
[datalaw.kr](https://datalaw.kr/)이고 이 저장소는 배포판입니다 — 여기서 CSV를 직접 고치지 마십시오.

수록 범위와 한계는 위 영문 절과 같습니다. 요약하면 **게시판에 공개된 것만** 세고, 비실명 의결은
셀 수 없으므로 모든 수치가 하한이며, 기계 추출이라 정확성을 보증하지 않습니다. 개별 사건을 근거로
쓰실 때는 표 마지막 열의 원문 링크를 반드시 확인하십시오.

학술 인용에는 **DOI**를 쓰십시오. 이 판은 `https://doi.org/10.5281/zenodo.22722237`이고,
항상 최신판을 가리키는 주소는 `https://doi.org/10.5281/zenodo.22722236`입니다.

논문·보고서처럼 나중에 검증되어야 하는 글에서는 날짜가 박힌 아카이브 판
(`https://datalaw.kr/archive/<이름>-YYYY-MM-DD.csv`)을 인용하십시오. 그 주소는 바뀌지 않습니다.

정리물의 이용 조건은 **CC BY 4.0**입니다 — 출처를 밝히시면 상업적 이용을 포함해 자유롭게 쓰고
고치실 수 있습니다. 결정문·판결문 원문은 저작권법 제7조에 따라 애초에 저작권 보호 대상이 아니고,
이 라이선스는 원문이 아니라 **정리물**에 붙습니다.
