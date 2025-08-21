# dti_pipeline/wrappers/brain_extraction.py

import logging
from pathlib import Path

log = logging.getLogger(__name__)

def run_hd_bet(input_file: str, output_file: str):
    """
    A placeholder function for running HD-BET.
    """
    log.info(f"HD-BET wrapper called for input: {input_file}")

    # In a real run, the hd-bet command would create this file.
    # We simulate that behavior here for the test.
    Path(output_file).touch()

    return output_file