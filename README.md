# PZH Image to Editable PPT

> Turn images, screenshots, scanned PDFs, and image-based PPTX pages into editable PowerPoint presentations.

![PZH Image to Editable PPT edition map](assets/edition-map.svg)

PZH Image to Editable PPT is a two-edition Agent Skill family for rebuilding visual slide sources into editable `.pptx` files. The output is designed for continued editing in PowerPoint or WPS: text, cards, connectors, tables, icons, and other supported page elements are handled as separate objects whenever the selected workflow can recover them reliably.

## Choose an edition

| Edition | Best fit | Model compatibility | Main strengths |
| --- | --- | --- | --- |
| **Base** | Single-page business cards, flows, tables, and regular visual slides | Optimized for Codex and Kimi | Clear three-stage workflow, editable text and structure, SVG-to-transparent-PNG icon handling, practical everyday delivery |
| **Cross** | Complex pages, scanned PDFs, image-based PPTX, multi-element diagrams, and selected page regions | Optimized for DeepSeek and Hunyuan 4, with broader cross-model compatibility | High-fidelity reconstruction, icon and gradient evidence, measured corners, text safeguards, delivery gates, and fail-closed validation |

The two editions share the same product goal. They differ in execution strategy and model compatibility, so choose the edition that matches the agent runtime you are using.

## Base

Use **Base** when you need a dependable, practical reconstruction workflow for ordinary business pages.

It is a good fit for:

- business cards and information panels;
- process diagrams and simple flowcharts;
- tables and regular data pages;
- single-page screenshots;
- pages that need editable text, cards, connectors, and common icons.

Base is optimized for Codex and Kimi. It keeps the workflow focused: inspect the page, build an editable object plan, generate the PPTX, then review the rendered result and focused corrections.

## Cross

Use **Cross** when the source page is visually dense or when the skill needs to run reliably across different agent models.

It is a good fit for:

- complex architecture diagrams;
- scanned PDFs and image-only PPTX files;
- pages with multiple layers, gradients, rounded panels, and dense icon systems;
- rebuilding a selected image region from an existing PPT;
- workflows that require stronger evidence and delivery gates.

Cross is optimized for DeepSeek and Hunyuan 4, while keeping a broader cross-model execution path. It includes the high-fidelity controls from the former Flash V6 line, including icon asset handling, gradient evidence, measured corner treatment, text safeguards, and fail-closed validation.

## What “editable” means

The result is intended for continued presentation editing. Depending on the source and the selected edition:

- text can be edited as text boxes;
- cards, panels, lines, and connectors can be moved or resized;
- supported icons are inserted as separate assets;
- tables and simple structures can be rebuilt as editable objects;
- the page is not delivered as a single full-slide background image.

Complex photos, illustrations, logos, and highly semantic visual assets may remain independent image assets when that is the most faithful and reliable representation.

## Package files

- `pzh-image-to-editable-ppt-base.skill` — Base edition, optimized for Codex and Kimi.
- `pzh-image-to-editable-ppt-cross.skill` — Cross edition, optimized for DeepSeek and Hunyuan 4.

Each archive contains its own `SKILL.md`, UI metadata, scripts, references, tests where applicable, and the icon assets required by that edition. Extract the archive with `SKILL.md` at the skill root before installing it into an AgentSkills-compatible runtime.

GitHub's repository-content transport does not accept these binary archives in one API request, so this first public repository version stores each archive as ordered, checksum-preserving Base64 parts under `downloads/`. Run the included rebuild script locally to recreate the original `.skill` files; the script validates the archive after decoding. This keeps the package bytes recoverable while the repository remains easy to inspect through the GitHub connector.

```bash
bash scripts/rebuild-skills.sh
```

The rebuilt files are written to `dist/` with the package names shown above. The published [v1.0.0 release](https://github.com/widemorrow/pzh-image-to-editable-ppt/releases/tag/v1.0.0) also provides the two archives as direct binary downloads.

## Former names and product lineage

The public names intentionally avoid the old `Lite` and `Flash` labels:

- former `pzh-imagetoppt-lite` → **Base**;
- former `pzh-imagetoppt-flash-v6` → **Cross**.

The new names describe the actual compatibility roles more accurately. `Base` does not mean low quality, and `Cross` refers to cross-model compatibility rather than a speed tier.

## Boundaries

- This product family reconstructs existing visual slide sources. It does not author a new presentation from a blank brief.
- Visual similarity, structural validity, editability, and target-application compatibility are separate checks.
- A machine validation result does not replace visual review of the rendered output.
- Source content, logos, fonts, and third-party assets remain subject to their own rights and usage rules.

## Third-party icon assets

The packaged skills include open-source icon snapshots. Their licenses, attribution requirements, aliases, and trademark notes are preserved inside each package under `assets/icons/THIRD_PARTY_NOTICES.md`. A summary is available in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

In particular, Simple Icons uses CC0 for the project while individual brand marks may still have separate trademark or usage requirements. Inclusion in the package does not grant trademark permission.
