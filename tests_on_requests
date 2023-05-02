import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_scripts():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path).split(";")[:-1]


@pytest.fixture()
def select_dfs(select_scripts, sqlalchemy_conn):
    return [execute_sql_to_df(conn=sqlalchemy_conn, sql=script) for script in select_scripts]

# select_1: выбрать топ-3 официанта по опыту из ресторана "Савва"
# select_2: вывести тип оплаты, по которому средний чек наивысший
# select_3: вывести названия ресторанов, тип оплаты и сумму платежа для ресторанов, где средний чек этого типа оплаты выше 5000
# select_4: посчитать средний чек 2023-04-09 для каждого официанта, отранжировать по опыту
# select_5: отранжировать официантов по суммарному чеку гостей за 2023-04-09
# select_6: вывести для каждого официанта текущий, предыдущий и следующий заказ

# в тестах осуществляется проверка количества строк в выводимой таблице и проверка соответствия атрибутов

def select_1(df):
    assert len(df) == 3
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["name_waiter", "birth_dt", "experience"]
    assert select_dfs.query("name_waiter == 'Петр Распутин'")['birth_dt'].iloc[0] == '1985-01-13'


def select_2(df):
    assert len(df) == 1
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["payment_type", "avg_bill"]
    assert select_dfs.query("payment_type == 'card'")['avg_bill'].iloc[0] == 4038.125


def select_3(df):
    assert len(df) == 1
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["restaurant", "payment_type", "sum_payment"]
    assert select_dfs.query("restaurant == 'Кофемания'")['payment_type'].iloc[0] == 'cash'
    assert select_dfs.query("restaurant == 'Кофемания'")['sum_payment'].iloc[0] == 10100
    

def select_4(df):
    assert len(df) == 10
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["waiter_id", "experience", "avg_bill"]
    assert select_dfs.query("waiter_id == 7")['experience'].iloc[0] == 8
    assert select_dfs.query("waiter_id == 8")['avg_bill'].iloc[0] == 6100
    

def select_5(df):
    assert len(df) == 10
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["waiter_id", "payment", "rank"]
    assert select_dfs.query("waiter_id == 1")['payment'].iloc[0] == 14218
    assert select_dfs.query("rank == 2")['waiter_id'].iloc[0] == 6
    assert select_dfs.query("rank == 3")['payment'].iloc[0] == 9000


def select_6(df):
    assert len(df) == 10
    print(df.columns.to_list(), df.dtypes)
    assert df.columns.to_list() == ["name_waiter", "order_id", "previous_order", "next_order"]
    assert select_dfs.query("name_waiter == 'Роман Попов'")['order_id'].iloc[0] == 6

def test(select_dfs):
    select_1(select_dfs[0])
    select_2(select_dfs[1])
    select_3(select_dfs[2])
    select_4(select_dfs[3])
    select_5(select_dfs[4])
    select_6(select_dfs[5])
