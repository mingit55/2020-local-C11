</header>

<!-- 견적 요청 -->

<div class="container padding">
    <div class="sticky-top pt-4 bg-white">
        <div class="d-between">
            <div>
                <span class="text-muted">시공 견적 요청</span>
                <div class="title">REQUESTS</div>
            </div>
            <button class="button-label" data-target="#request-modal" data-toggle="modal">견적 요청</button>
        </div>
        <div class="table-head">
            <div class="cell-10">상태</div>
            <div class="cell-40">내용</div>
            <div class="cell-15">요청자</div>
            <div class="cell-15">시공일</div>
            <div class="cell-10">견적 개수</div>
            <div class="cell-10">+</div>
        </div>
    </div>
    <div class="list">
        <?php foreach($reqList as $req):?>
            <div class="table-item">
                <div class="cell-10">
                    <?php if(!$req->sid):?>
                        <span class="rounded-pill bg-gold text-white px-3 py-2 fx-n3">진행 중</span>
                    <?php else:?>
                        <span class="rounded-pill bg-gold text-white px-3 py-2 fx-n3">완료</span>
                    <?php endif;?>
                </div>
                <div class="cell-40">
                    <p class="text-muted fx-n2"><?=nl2br(htmlentities($req->contents))?></p>
                </div>
                <div class="cell-15">
                    <span><?=$req->user_name?></span>
                    <small class="text-muted">(<?=$req->user_id?>)</small>
                </div>
                <div class="cell-15"><?=$req->start_date?></div>
                <div class="cell-10"><?=$req->cnt?></div>
                <div class="cell-10">
                    <?php if($req->uid == user()->id):?>
                        <button class="text-white bg-blue fx-n3 px-2 py-2" data-id="<?=$req->id?>" data-toggle="modal" data-target="#view-modal">견적 보기</button>
                    <?php elseif(user()->auth && !$req->sid && !$req->sended):?>
                        <button class="text-white bg-blue fx-n3 px-2 py-2" data-id="<?=$req->id?>" data-toggle="modal" data-target="#response-modal">견적 보내기</button>
                    <?php else:?>
                        -
                    <?php endif;?>
                </div>
            </div>
        <?php endforeach;?>
    </div>
</div>

<!-- /견적 요청 -->

<!-- 보낸 견적 -->
<?php if(user()->auth):?>
<div class="bg-gray">
    <div class="container padding">
        <div class="sticky-top pt-4 bg-gray">
            <div>
                <span class="text-muted">보낸 견적</span>
                <div class="title blue">RESPONSES</div>
            </div>
            <div class="table-head">
                <div class="cell-10">상태</div>
                <div class="cell-40">내용</div>
                <div class="cell-15">요청자</div>
                <div class="cell-15">시공일</div>
                <div class="cell-10">입력한 비용</div>
                <div class="cell-10">+</div>
            </div>
        </div>
        <div class="list">
            <?php foreach($resList as $res):?>
                <div class="table-item">
                    <div class="cell-10">
                        <?php if(!$res->sid):?>
                            <span class="rounded-pill bg-gold text-white px-3 py-2 fx-n3">진행 중</span>
                        <?php elseif($res->sid == $res->id):?>
                            <span class="rounded-pill bg-gold text-white px-3 py-2 fx-n3">선택</span>
                        <?php else: ?>
                            <span class="rounded-pill bg-gold text-white px-3 py-2 fx-n3">미선택</span>
                        <?php endif;?>
                    </div>
                    <div class="cell-40">
                        <p class="text-muted fx-n2"><?=nl2br(htmlentities($res->contents))?></p>
                    </div>
                    <div class="cell-15">
                        <span><?=$res->user_name?></span>
                        <small class="text-muted">(<?=$res->user_id?>)</small>
                    </div>
                    <div class="cell-15"><?=$res->start_date?></div>
                    <div class="cell-10"><?=number_format($res->price)?></div>
                    <div class="cell-10">-</div>
                </div>
            <?php endforeach;?>
        </div>
    </div>
</div>
<?php endif;?>      
<!-- /보낸 견적 -->

<!-- 요청 모달 -->
<div id="request-modal" class="modal fade">
    <div class="modal-dialog">
        <form class="modal-content" method="post" action="/requests">
            <div class="modal-body pt-4 pb-3 px-4">
                <div class="title text-center">
                    REQUEST
                </div>
                <div class="form-group mt-4">
                    <label for="start_date">시공일</label>
                    <input type="date" id="start_date" class="form-control" name="start_date" required>
                </div>
                <div class="form-group">
                    <textarea name="contents" id="contents" cols="30" rows="10" class="form-control" placeholder="내용을 입력하세요" required></textarea>
                </div>
                <div class="form-group mt-3">
                    <button class="w-100 py-3 text-white bg-blue">작성 완료</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /요청 모달 -->


<!-- 응답 모달 -->
<div id="response-modal" class="modal fade">
    <div class="modal-dialog">
        <form class="modal-content" method="post" action="/responses">
            <input type="hidden" id="qid" name="qid">
            <div class="modal-body pt-4 pb-3 px-4">
                <div class="title text-center">
                    RESPONSE
                </div>
                <div class="form-group mt-4">
                    <label for="price">비용</label>
                    <input type="number" id="price" class="form-control" name="price" min="1" value="10000" required>
                </div>
                <div class="form-group mt-3">
                    <button class="w-100 py-3 text-white bg-blue">입력 완료</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /응답 모달 -->

<!-- 보기 모달 -->
<div id="view-modal" class="modal fade">
    <div class="modal-dialog">
        <form class="modal-content" method="post" action="/estimates/pick">
            <input type="hidden" id="pick_qid" name="qid">
            <input type="hidden" id="pick_sid" name="sid">
            <div class="modal-body pt-4 pb-3 px-4">
                <div class="title text-center">
                    ESTIMATES
                </div>
                <div class="mt-3 table-head">
                    <div class="cell-30">전문가 정보</div>
                    <div class="cell-40">비용</div>
                    <div class="cell-30">+</div>
                </div>
                <div class="list">
                    
                </div>
            </div>
        </form>
    </div>
</div>
<!-- /보기 모달 -->

<script>
    $(function(){
        $("[data-target='#response-modal']").on("click", function(){
            $("#qid").val(this.dataset.id);
        });

        $("[data-target='#view-modal']").on("click", function(){
            $("#pick_qid").val(this.dataset.id);

            $.getJSON("/responses?id=" + this.dataset.id, function(res){
                if(res.list && res.req){
                    $("#view-modal .list").html("");
                    res.list.forEach(item => {
                        $("#view-modal .list").append(`<div class="table-item">
                                                            <div class="cell-30">
                                                                <span>${item.user_name}</span>
                                                                <small class="text-muted">(${item.user_id})</small>
                                                            </div>
                                                            <div class="cell-40">
                                                                <span>${parseInt(item.price).toLocaleString()}</span>
                                                                <small class="text-muted">원</small>
                                                            </div>
                                                            <div class="cell-30">
                                                                ${
                                                                    res.req.sid ? `-` : `<button class="bg-blue text-white p-2 fx-n3" data-id="${item.id}">선택</button>`
                                                                }
                                                                
                                                            </div>
                                                        </div>`);
                    });
                }
            });
        });

        $("#view-modal .list").on("click", "button", function(){
            $("#pick_sid").val(this.dataset.id);
        });
    });
</script>