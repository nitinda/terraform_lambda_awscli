import subprocess
import logging
import json
# import awscli
import os
import sys

logger = logging.getLogger()
logger.setLevel(logging.INFO)
sys.path.insert(0, "/opt/python")

def run_command(command):
    command_list = command.split(' ')

    try:
        logger.info("Running shell command: \"{}\"".format(command))
        result = subprocess.run(command_list, stdout=subprocess.PIPE)
        logger.info("Command output:\n---\n{}\n---".format(result.stdout.decode('UTF-8')))
    except Exception as e:
        logger.error("Exception: {}".format(e))
        return False

    return True

def lambda_handler(event, context):
    run_command('/opt/python/aws-list-all query --directory /tmp/data/ --service efs')
