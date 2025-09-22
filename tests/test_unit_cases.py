# tests/test_unit_cases.py

import pytest
from fastapi.testclient import TestClient
from api.main import app   # or your FastAPI entrypoint

client = TestClient(app)

#test cases with respect to home route
def test_home():
    response = client.get("/")
    assert response.status_code == 200
    assert "Document Portal" in response.text

#similarly you can create your own test cases for other routes and functionalities
