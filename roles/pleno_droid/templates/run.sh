#!/bin/bash
DROID={{ item.venv }}/bin/python
RUN_FOLDER=/mnt/nas/DecodingRuns/KET-11/20240523_KET11_JW_2412160129_NIPT_3283plex_EXP_071_P2

$DROID -m pleno_droid \
	-i "$RUN_FOLDER" \
	-o "/mnt/nas/_USERS/Antony/BIOINF-1426-{{ item.version }}" \
	-c "decode_proto1.yaml" \
	-t 4 \
	--Pipeline.well_match "A03|A05|A06|A07|A08|A09|B03|B05|B06|B07|B08|B09|C03|C05|C06|C07|C08|C09|D03|D05|D06|D07|D08|D09|E03|E05|E06|E07|E08|E09|F03|F05|F06|F07|F08|F09|G03|G05|G06|G07|G08|G09|H08|H09" \
	--resource-dirs /mnt/nas/_DATA/resources

