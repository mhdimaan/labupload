def login():
    username=input("Enter the username")
    password=input("enter the password")
    if username=="Admin" and password=="admin123":
        print("login succesfull")
    else:
        sprint("invalid credentials")