# GitHub-Repos-Finder
This is my try solving RippleEgypt's task, it's a Github Repos Finder that fetched Github repositories based on the user's input for a repo name, it lists all of the repos with the specified query name with a limit of 50 repos.

# The Task included:

<ul>
<li>Using Github API v3 to fetch repos from GET endpoint :"https://api.github.com/search/repositories?q=:query" with repo name instead of :query.</li>
<li>Displaying the results in a TableView with custom TableViewCell.</li>
<li>Using custom TableViewCell including the image of the user, repo's name, and the description (if found).</li>
<li>API authentication using Github OAuth 2.0 Authentication.</li>
<ul/>

# Technologies used:

<ul>
<li>RxSwift</li>
<li>RxCocoa</li>
<li>Alamofire</li>
<li>Core Data (incomplete unfortunately, but will fix it later. )</li>
<li>MVVM architecture</li>
<li>DI (Dependency Injection) in multiple ways.</li>
<li>Two sources of data: Real Github API and a mocked local JSON files.</li>
<li>Unit tests for the project.</li>

<ul/>
