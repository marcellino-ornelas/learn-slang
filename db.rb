require "pg"


# Create the connection to my database : slangDictionary
def connection
  PG::Connection.new(dbname: "slangDictionary")
end

def create_table(table_name)
  connection.exec("CREATE TABLE IF NOT EXISTS #{table_name} (id SERIAL PRIMARY KEY,
    slang_word VARCHAR (100),
    slang_def VARCHAR (100),
    slang_ex VARCHAR (100)
    )")
  p "Created your table : #{table_name}"
end

def retrieve_question_data()

end

def get_questions_length()
end
