import os
from src.swen344_db_utils import *

def rebuildTables():
    exec_sql_file('src/schema.sql')

def list_curves():
    """List all roast curves with their PKs"""
    return exec_get_all("SELECT id, nickname FROM roast_curves")

def get_reviewer(id):
    """Return a tuple reviewer data"""
    sql = """
        SELECT id, username
          FROM reviewers
          WHERE id=%(id)s
          LIMIT 1
    """
    return exec_get_one(sql, {'id': id})

# More stubs will be added here.
# Replace this comment with the provided method stubs provided in the practicum
# description
