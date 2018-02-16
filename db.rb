require "pg"


# Create the connection to my database : slangDictionary
def connection
  PG::Connection.new(dbname: "slangDictionary")
end

def create_table(table_name)
  connection.exec("CREATE TABLE IF NOT EXISTS #{table_name} (id SERIAL PRIMARY KEY,
    options VARCHAR ARRAY[3],
    def VARCHAR (100),
    name VARCHAR (100)
    )")
  p "Created your table : #{table_name}"
end



def get_questions_length()
  data = Connection.exec("SELECT * FROM words")
  data.value.size
end





def retrieve_question_data(i)
  data = Connection.exec("SELECT * FROM words")
  data[i]
end



  # id number give me name definition
  # display definition



  #get question (id) then display question.def

  # get name(id.options) and append real answer(id.name)
  #

end
