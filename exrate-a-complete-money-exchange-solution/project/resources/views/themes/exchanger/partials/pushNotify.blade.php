@if(config('basic.push_notification'))
    <div class="notification-panel" id="pushNotificationArea">
        <button class="dropdown-toggle">
            <i class="fal fa-bell custom-bell"></i>
            <span v-if="items.length > 0" class="badge">@{{ items.length }}</span>
        </button>

        <ul class="notification-dropdown">
            <div class="dropdown-box">
                <li>
                    <a v-for="(item, index) in items" @click.prevent="readAt(item.id, item.description.link)"
                       href="javascript:void(0)" class="dropdown-item">
                        <i class="fal fa-bell custom-bell"></i>
                        <div>
                            <h6 class="font-weight-bold" v-cloak v-html="item.description.text"></h6>
                            <p v-cloak>@{{ item.formatted_date }}</p>
                        </div>
                    </a>
                </li>
            </div>
            <div class="clear-all fixed-bottom">
                <a class="clear-notification" v-if="items.length > 0" @click.prevent="readAll"
                   href="javascript:void(0)">@lang('Clear')</a>
                <a class="clear-notification" v-if="items.length == 0"
                   href="javascript:void(0)">@lang('You have no notifications')</a>
            </div>
        </ul>
    </div>


@endif
