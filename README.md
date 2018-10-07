# Keyboard

Have you ever says that "we are lucky to have the test case in project"?
never - often - usually or always

How about me and my partner?
The answer is always, alway and alway. So, why???

Project bigger and bigger day by day, accompany the complexion business logic significantly increase. There are situations you forgot tiny case make your code broken. You might or might not figure out when you do manually test on browser.

Do not let test** blame your system (Actually they blamed you Haha test** suck :d). Limit it as much as possible and control it as soon as possible. okay, write test case this is the best way to control the 90% that thing.

you NEED TO or HAVE TO or MUST write

This blog I will share how to testing Phoenix channels and handle the channel better. Small demo easy to understand

I got problem when I wrote the code for channel. I wrote the code to connect and return data inside the channel. It makes the code complex and hard to detect where is problem. I spent a lot of time to debugging and big problem here is I did not write test case for channel.

I start to write the test case and cannot connect with channel. I asked my team, and A man give me suggestion. His idea is I should separate my code, i need to create a service to define the logic and return what channel wants. Channel will call service and return reply the info for Frontend. Damn!!! Good idea but i need to write test case for Channel as well. His idea is good for me. To handle that way I have 2 steps:

1. Define the logic code in service
2. Write test case for service
3. Define the channel
4. Write test case for channel

I have small demo called Keyboard. The thirst party will connect to Keyboard Channel to get and update information and channel will call service to take action.

To get started, I define a service all **KeyboardAppService** and write test case for `KeyboardAppServiceTest`.

I will test 4 cases:

1. `get_keyboard/1 with valid id`
2. `get_keyboard/1 with invalid id`
|> 2 case defined to make test for channel connect with valid keyboard_id and invalid keyboard_id.
3. `scan_keyboard/1 return correct data`
4. `update_brand/1 return correct data`

In this service I only assert data_key return should correct because the data_value I already tested in another test case.


Thirst party it might mobile app or website... To easy I will call it is the App.

Get the information: App need to join channel to get data.

```
{:ok, scan_data, socket} =
        socket("", %{
          device_id: "iphone",
          device_name: "janyIphone"
        })
        |> subscribe_and_join(KeyboardChannel, "keyboard:#{keyboard.id}")
```

Once subscribed and joined the process to the "keyboard:#{keyboard.id}" topic It returns {:ok, reply, socket} or {:error, reply}

So, we define the test case for join valid channel with return {:ok, reply, socket} and test for the scan_data return also
and un valid chanel with return {:error, reply}.

Update information: App need to communicate with server via `handle_in`. In test, We use `push` to communicate in socket.

```
ref = push(socket, "update_brand", %{id: keyboard.id, brand: "brand"})
```
and assert ref return :ok with data you want to update

I pushed whole the code on github: you can take a look at 

I use `ex_machina` to create factory, `mix_test_watch` to watch the test when I change the code and `excoveralls` to check code coverage.

Let see 2 pages I wrote test case: 100% coverage >___<


How about the question: Write test first or write code first. My answer is depend. 
Some case I want to know the result write code first, some case in the very very very complex I choose write test first, I can check result on my test case instead use pry to know the how code works.



To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

`open cover/excoveralls.html` from terminal

