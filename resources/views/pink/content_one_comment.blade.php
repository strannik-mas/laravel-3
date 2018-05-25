{{--21 урок--}}
<li id="li-comment-{{ $data['id'] }}" class="comment even borGreen">
    <div id="comment-{{ $data['id'] }}" class="comment-container">
        <div class="comment-author vcard">
            <img alt="" src="https://www.gravatar.com/avatar/{{ $data['hash'] }}?d=mm&s=75" class="avatar" height="75" width="75" />
            <cite class="fn">{{ $data['name'] }}</cite>
        </div>
        <!-- .comment-author .vcard -->
        <div class="comment-meta commentmetadata">
            <div class="intro">

            </div>
            <div class="comment-body">
                <p>{{ $data['text'] }}</p>
            </div>
            <div class="reply group">
                <a class="comment-reply-link" href="#respond" onclick="return addComment.moveForm(&quot;comment-{{ $data['id'] }}&quot;, &quot;{{ $data['id'] }}&quot;, &quot;respond&quot;, &quot;{{ $data['article_id'] }}&quot;)">Reply</a>
            </div>
            <!-- .reply -->
        </div>
        <!-- .comment-meta .commentmetadata -->
    </div>
</li>