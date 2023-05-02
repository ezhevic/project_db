import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def view_scripts():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path).split(";")[:-1]


@pytest.fixture()
def view_dfs(view_scripts, sqlalchemy_conn):
    return [execute_sql_to_df(conn=sqlalchemy_conn, sql=script) for script in view_scripts]

# view_1: представление таблицы loyalty_card со скрытым полем номера карты
# view_2: сводка по работавшим 2023-04-09 официантам с указанием количества обслуженных заказов (работал = обслужил хотя бы 1 заказ)
# view_3: сводка ингредиентов, которые используются в блюдах
# view_4: сводка работников ресторанов
# view_5: сводка блюд в меню
# view_6: представление о посетителях

# в тестах осуществляется проверка количества строк в выводимой таблице и проверка соответствия атрибутов

def view_1(df):
    assert len(df) == 10
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["card_id", "card_number", "bonus", "valid_from", "valid_to"]
    assert view_dfs.query("card_id == '3'")['bonus'].iloc[0] = 1000
    assert view_dfs.query("card_id == '5'")['valid_to'].iloc[0] = '2029-10-10'


def view_2(df):
    assert len(df) == 5
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["waiter_id", "restaurant_id", "name_waiter", "birth_dt",
                                    "experience", "phone_number", "count_orders"]
    assert view_dfs.query("waiter_id == '1'")['restaraunt_id'].iloc[0] = 1
    assert view_dfs.query("waiter_id == '8'")['experience'].iloc[0] = 7


def view_3(df):
    assert len(df) == 33
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["name_ingredient", "name_dish"]
    assert view_dfs.query("name_ingredient == 'Творог'")['name_dish'].iloc[0] = 'Сырники'


def view_4(df):
    assert len(df) == 10
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["waiter_id", "experience", "avg_bill"]
    assert view_dfs.query("name_rest == 'Северяне'")['name_waiter'].iloc[0] = 'Роман Попов'
    

def view_5(df):
    assert len(df) == 15
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["name_rest", "name_waiter"]
    assert view_dfs.query("name_dish == 'Филе палтуса'")['menu_category'].iloc[0] = 'Нежное'


def view_6(df):
    assert len(df) == 10
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["menu_id", "menu_category", "name_dish"]
    assert view_dfs.query("customer_id == '3'")['order_id'].iloc[0] = 5
    assert view_dfs.query("customer_id == '8'")['name_rest'].iloc[0] = 'Кофемания'


def test(view_dfs):
    view_1(view_dfs[0])
    view_2(view_dfs[1])
    view_3(view_dfs[2])
    view_4(view_dfs[3])
    view_5(view_dfs[4])
    view_6(view_dfs[5])
