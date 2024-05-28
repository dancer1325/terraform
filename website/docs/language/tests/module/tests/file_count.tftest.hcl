variables {
  bucket = "my_test_bucket"
  files = {
    "file-one.txt": "data/files/file_one.txt"
    "file-two.txt": "data/files/file_two.txt"
  }
}

provider "aws" {
  region = "us-east-1"
}

run "setup" {
  # Create the S3 bucket we will use later.

  module {
    source = "./tests/setup"
  }
}

run "execute" {
  # This is empty, we just run the configuration under test using all the default settings.
}

run "verify" {
  # Load and count the objects created in the "execute" run block.

  module {
    source = "./tests/loader"
  }

  assert {
    condition = length(data.aws_s3_objects.objects.keys) == 2
    error_message = "created the wrong number of s3 objects"
  }
}
