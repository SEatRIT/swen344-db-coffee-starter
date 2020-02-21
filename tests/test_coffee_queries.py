import unittest
from src.coffee import *
from src.swen344_db_utils import connect
from decimal import *
from .test_utils import *

class TestCoffee(unittest.TestCase):
    def setUp(self):
        rebuildTables()
        insertTestData()

    def test_list_curves(self):
        """Test that we can list the available roast curves """
        results = list_curves()
        results.sort()
        expected = [
            (1, 'smooth'),
            (2, 'spikey'),
            (3, 'mountain'),
        ]
        self.assertEqual(expected, results)

    def test_get_reviewer(self):
        """Username of id 1 should be pedant72"""
        expected = (1, 'pedant72')
        self.assertEqual(expected, get_reviewer(id=1))
