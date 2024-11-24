use std::fs::File;
use std::io::{BufRead, BufReader};

struct Parser {
    input_file: BufReader<File>,
    finished: bool,
    current_command: Option<String>,
}

impl Parser {
    pub fn new(input_file: File) -> Parser {
        Parser {
            input_file: BufReader::new(input_file),
            finished: false,
            current_command: None,
        }
    }

    pub fn has_more_commands(&self) -> bool {
        self.finished
    }

    pub fn advance(&mut self) {
        let mut line = String::new();
        match self.input_file.read_line(&mut line) {
            Ok(0) => self.finished = true,
            Ok(_) => {
                self.current_command = Some(line.trim().to_string());
            }
            Err(e) => panic!("Error reading line: {}", e),
        }
    }
}
