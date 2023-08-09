function buildCommentDiv(data){
    const dateString = new Date().toLocaleString("en-us", {
        timeStyle: "medium",
        dateStyle: "medium"
    });

    const divComment = document.createElement('div');
    divComment.id = `message-${data.commentId}`;
    divComment.classList.add('comment');
    const usernametag = document.createElement('strong');
    usernametag.classList.add('comment-author');
    usernametag.appendChild(document.createTextNode(data.username));
    const dateSpan = document.createElement('span');
    dateSpan.appendChild(document.createTextNode(dateString));
    dateSpan.classList.add('comment-date');
    const commentText = document.createElement('div');
    commentText.classList.add('comment-input');
    commentText.appendChild(document.createTextNode(data.commentText));
    divComment.append(usernametag,dateSpan,commentText);
    return divComment;
}

const commentList = document.getElementById('comments-list');
const commentButton = document.getElementById('comment-button');
const commentTextArea = document.getElementById('comment-input');

if(commentButton){
    commentButton.addEventListener('click', function(ev){
        const commentText = commentTextArea.value;
        const postId = ev.currentTarget.dataset.postid;

        const payLoad = {
            postId,
            commentText
        }

        const fetchOptions = {
            method: "POST",
            headers: {
                "Content-Type":"application/json"
            },
            body: JSON.stringify(payLoad)
        }
        fetch("/comments/create", fetchOptions)
            .then((resp) => resp.json())
            .then((data) => {
                console.log(data);
                if(data.statusCode < 0){
                    window.location.replace(data.redirectTo);
                } else {
                    const commentDiv = buildCommentDiv(data);
                    commentList.append(commentDiv);
                    commentTextArea.value="";
                    window.location.replace(`#message-${data.commentId}`)
                }
            })
        .catch(error => console.error(error))
    });
};

if(commentTextArea){
    commentTextArea.addEventListener('keypress', function(ev){
        console.log(ev);
        const keyPressed = ev.key;
        if(keyPressed === 'Enter' && !ev.ctrlKey){
            ev.preventDefault();

            const commentText = commentTextArea.value;
            const postId = ev.currentTarget.dataset.postid;
    
            const payLoad = {
                postId,
                commentText
            }
    
            const fetchOptions = {
                method: "POST",
                headers: {
                    "Content-Type":"application/json"
                },
                body: JSON.stringify(payLoad)
            }
            fetch("/comments/create", fetchOptions)
                .then((resp) => resp.json())
                .then((data) => {
                    console.log(data);
                    if(data.statusCode < 0){
                        window.location.replace(data.redirectTo);
                    } else {
                        const commentDiv = buildCommentDiv(data);
                        commentList.append(commentDiv);
                        commentTextArea.value="";
                        window.location.replace(`#message-${data.commentId}`)
                    }
                })
            .catch(error => console.error(error))
        }
    })
}