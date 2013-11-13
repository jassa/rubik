def cubo_semantico
  @cubo_semantico ||= {
    "int" =>  {
      "int" => {
        "+" => "int",
        "-" => "int",
        "*" => "int",
        "/" => "int",
        ">" => "boolean",
        "<" => "boolean",
        "=" => "int",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      },
      "float" => {
        "+" => "float",
        "-" => "float",
        "*" => "float",
        "/" => "float",
        ">" => "boolean",
        "<" => "boolean",
        "=" => "int",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      },
      "string" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "boolean" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "char" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      }
    },
    "float" => {
      "int" => {
        "+" => "float",
        "-" => "float",
        "*" => "float",
        "/" => "float",
        ">" => "boolean",
        ">=" => "boolean",
        "<=" => "boolean",
        "<" => "boolean",
        "=" => "float",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      },
      "float" => {
        "+" => "float",
        "-" => "float",
        "*" => "float",
        "/" => "float",
        ">" => "boolean",
        ">=" => "boolean",
        "<=" => "boolean",
        "<" => "boolean",
        "=" => "float",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      },
      "Double" => {
        "+" => "Double",
        "-" => "Double",
        "*" => "Double",
        "/" => "Double",
        ">" => "boolean",
        ">=" => "boolean",
        "<=" => "boolean",
        "<" => "boolean",
        "=" => "float",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      },
      "string" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "boolean" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "char" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      }
    },
    "string" => {
      "int" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "float" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "string" => {
        "+" => "string",
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => "string",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      },
      "boolean" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "char" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      }
    },
    "boolean" => {
      "int" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "float" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "Double" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" => nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "string" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => nil,
        "==" => nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "boolean" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => "boolean",
        "==" => "boolean",
        "<>" => "boolean",
        "&&" => "boolean",
        "||" => "boolean",
      },
      "char" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      }
    },
    "char" => {
      "int" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "float" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "string" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "boolean" => {
        "+" => nil,
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        "<" => nil,
        "=" => nil,
        "==" =>  nil,
        "<>" => nil,
        "&&" => nil,
        "||" => nil,
      },
      "char" => {
        "+" => "char",
        "-" => nil,
        "*" => nil,
        "/" => nil,
        ">" => nil,
        ">=" => nil,
        "<=" => nil,
        "<" => nil,
        "=" => "char",
        "==" =>  "boolean",
        "<>" => "boolean",
        "&&" => nil,
        "||" => nil,
      }
    }
  }
end