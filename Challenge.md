Congratulations! Welcome to the next step of the Double Symmetry hiring process!

## What this task is about
We will be looking at:
- Project structure and organization
- Component composition: where and how you define the boundaries of your components and how they are assembled
- Attention to detail and UI Performance: How faithfully designs are implemented to provide the best possible user experience
- Code reusability, readability and maintainability:
    - Finding the right point of abstraction in your UI components, helpers functions and APIs
    - Writing in a style that is easy to follow for others and easy to edit in the future

## How and when to send your work 📩
First of all you don't have a deadline for completing this task, however we will ask you how much time you spent on it ⏳.

When you're done, simply respond to our message with a link to your git repository.
Please be sure to include a Readme with build instructions and thoughts about how you think the task went.

## The task 🏁
The task is to create a mini homepage for a music app, consisting of:
- a 2xn `UICollectionView` populated by an mock API
- include the ability to search while pinging an API for the results
- pagination for the home page, load more content as you reach the end

**You can find designs [here](https://www.figma.com/file/YntNyOkM50bFAln5C1DVXp/Double-Symmetry-Task?node-id=0%3A1)**

The main page shall be populated by this mock API: http://www.mocky.io/v2/5df79a3a320000f0612e0115
- The grid, should be evenly distributed as defined in the designs.
- The labels, and images will be populated from the API responses.
- The list should be paginatable, once you've reached the end, keep appending the mock response up to 5 times.

You should be able to search, responses populated by this mock API: http://www.mocky.io/v2/5df79b1f320000f4612e011e
- display shold look exactly as the main page, but populated by a `UISearchController` 
- while fetching new content, the search bar should replace the search icon with a `UIActivityController`
- use the appropriate debounce when receiving text, fetch the mock response and randomly shuffle the array of items to display

## Requirements
- Use the Swift language
- Use `Codable` to parse the API's
- Use the MVVM paradigm with either `RxSwift` or the new `Combine` framework from Apple

## Notes
- Feel free to create your UI by using Storyboards or in code ☺️
- Feel free to use Cocoapods if you want to include 3rd party frameworks / libraries

And of course, please get in touch with us if you have any questions.

Best of luck! We look forward to seeing your work. 🤩