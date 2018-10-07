
#Keyboard channel

**1) Define Service**
  - Define the logic code in service
  - Write test case for service

**2) Define Channel**
  - Define the channel
  - Write test case for channel

### Logic
To get started, I define a service all **KeyboardAppService** and write test case for `KeyboardAppServiceTest`.

I will test 4 cases:

#### 1. `get_keyboard/1 with valid id`

#### 2. `get_keyboard/1 with invalid id`
    (2 case defined to make test for channel connect with valid keyboard_id and invalid keyboard_id.)

#### 3. `scan_keyboard/1 return correct data`

#### 4. `update_brand/1 return correct data`

In this service I only assert data_key return should correct because the data_value I already tested in another test case.


Thirst party it might mobile app or website... To easy I will call it is the App.

### Get the information: 

App need to join channel to get data.

```
{:ok, scan_data, socket} =
        socket("", %{
          device_id: "iphone",
          device_name: "janyIphone"
        })
        |> subscribe_and_join(KeyboardChannel, "keyboard:#{keyboard.id}")
```

Once subscribed and joined the process to the **"keyboard:#{keyboard.id}"** topic It returns 

**{:ok, reply, socket}** or **{:error, reply}**

So, we define the test case for:

1. join valid channel with return {:ok, reply, socket} and test for the scan_data return

2. Invalid chanel with return {:error, reply}.

### Update information: 

App need to communicate with server via `handle_in`. In test, We use `push` to communicate in socket.

```
ref = push(socket, "update_brand", %{id: keyboard.id, brand: "brand"})
```
and assert ref return :ok with data you want to update

I pushed whole the code on github: you can take a look at 

I use **ex_machina** to create factory, `mix_test_watch` to watch the test when I change the code and `excoveralls` to check code coverage.

### Run test case

```
mix test
```

Let see 2 pages I wrote test case: 100% coverage >___<

#### Keyboard app service
![screen shot 2018-10-06 at 11 07 13 am](https://user-images.githubusercontent.com/6791942/46582993-4101db00-ca82-11e8-9b3a-f6c5c59a9fdb.png)

#### Keyboard channel
![screen shot 2018-10-06 at 11 06 52 am](https://user-images.githubusercontent.com/6791942/46582990-32b3bf00-ca82-11e8-8657-3ab4146b9454.png)


*Read comment code to get more understand*

Check code detail at: [`keyboard_chanel`](https://github.com/mymai91/keyboard_channel)


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

`open cover/excoveralls.html` from terminal
