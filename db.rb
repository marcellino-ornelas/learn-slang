require "pg"

# Create the connection to my database : slangDictionary
def connection
  PG::Connection.new(dbname: "slangDictionary")
end

def create_table(table_name)
  connection.exec("CREATE TABLE IF NOT EXISTS #{table_name} (id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    definition VARCHAR,
    options VARCHAR ARRAY[3]
    )")
  p "Created your table : #{table_name}"
end


def get_questions_length()
  data = connection.exec("SELECT * FROM words")
  data.values.size
end


def retrieve_question_data(i)
  data = connection.exec("SELECT * FROM words")
  data[i]
end
