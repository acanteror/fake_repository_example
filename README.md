When working on projects that consume data from an API Rest, for example, or any other remote data source, we will not always have that data source available at all times, either because it is not yet developed or for any other reason.

In order not to block the development of a functionality, we can make use of abstraction to fake our repository so that we can continue our development without depending on the external data source being available.

To do this, the first thing we need is to know the API contract, that is to say, to know (if it is previously agreed better) what data the API is going to return to us.

Let us take, for example, a request to an API that must return a list of users. We begin by defining the corresponding json for the user.

[user.json](https://github.com/acanteror/fake_repository_example/blob/main/test/features/user/domain/models/fixtures/user.json) 

Once we have defined the json that will return the API for each user, it will be easy for us to create our User model.

[user.dart](https://github.com/acanteror/fake_repository_example/blob/main/lib/features/user/domain/models/user.dart) 

The next thing we need is to define an interface in the domain layer that establishes the functionality of our UserRepository.

[user_repository.dart](https://github.com/acanteror/fake_repository_example/blob/main/lib/features/user/domain/repositories/user_repository.dart)

If we had the API available to obtain that data we would have to implement our ApiUserRepository.

[api_user_repository.dart](https://github.com/acanteror/fake_repository_example/blob/main/lib/features/user/infraestructure/repositories/api_user_repository.dart)

But it wouldn't help us, for the moment, since we don't have that request available at the API yet.

Therefore, our best option is to create another implementation that simulates the response of the API. A FakeUserRepository.

[fake_user_repository.dart](https://github.com/acanteror/fake_repository_example/blob/main/lib/features/user/infraestructure/repositories/fake_user_repository.dart) 

Both implementations belong to the infrastructure (or data) layer of our application.

As we can see, our FakeApiRepository overwrites the method defined by UserRepository and simulates an API call that returns a list of users.

Creating the fakes for our users is easy and we will have the job done if we have previously spent 5 minutes testing our User model.

[model tests](https://github.com/acanteror/fake_repository_example/tree/main/test/features/user/domain/models) 

Ok, we already have our FakeRepository, now we must make that when we inject in our UserBloc a UserRepository the instance that is created is the FakeUserRepository. So, if our UserBloc is something like:

[user_bloc.dart](https://github.com/acanteror/fake_repository_example/blob/main/lib/features/user/domain/bloc/user_bloc.dart)

We can make use of our dependency injector (in this example we will use the GetX package)

[injector.dart](https://github.com/acanteror/fake_repository_example/blob/main/lib/di/injector.dart)

We can see how when we enter UserRepository the instance that is created is of the class FakeUserRepository. As soon as we have our API request available and we have implemented our ApiUserRepository it will be enough to replace FakeUserRepository by ApiUserRepository.

And that is all, the rest of the example consists of painting a list from the data that UserBloc issues, which in turn gets it from the UserRepository (that is, our FakeUserRepository).

In this way we can complete our functionality without depending on being able to use an external data source.
