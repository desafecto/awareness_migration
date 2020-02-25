import logging
logging.basicConfig(
    filename='logs\\logfile.log',
    filemode='w',
    format='   %(levelname)s:%(asctime)s --> %(message)s',
    datefmt='%d/%m/%Y %I:%M:%S %p',
    level=logging.DEBUG
    )
logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')
logging.error('This is an error!')
logging.critical('appropriate for the specific error and application domain')

print("  ---- El nivel de log actualmente es: {}".format("Antonio") )