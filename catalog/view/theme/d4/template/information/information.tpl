<?php echo $header; ?>
<style>
/* ===== TABLE STYLES (global for all info pages) ===== */
.table-bordered { border: 1px solid #ddd; }
.table { width: 100%; max-width: 100%; border-spacing: inherit; margin-bottom: 17px; }
.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td { border: 1px solid #ddd; }
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th,
.table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 8px; line-height: 1.42857; vertical-align: top; border-top: 1px solid #ddd;
}
</style>

<?php if ($information_id == 7): ?>
<style>
/* ===== CONTACTS PAGE ===== */
.contacts-page { padding-bottom: 60px; }

/* Phones */
.cm-section-label {
    font-size: 12px;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: #8D9293;
    font-family: HelveticaNeueCyrBold;
    margin: 0 0 14px;
}
.cm-phones-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    margin-bottom: 44px;
}
.cm-phone-card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 2px 12px rgba(44,61,81,0.09);
    padding: 20px 24px;
    display: flex;
    flex-direction: column;
    gap: 12px;
    transition: box-shadow 0.2s, transform 0.2s;
}
.cm-phone-card:hover {
    box-shadow: 0 6px 20px rgba(44,61,81,0.14);
    transform: translateY(-2px);
}
.cm-phone-number {
    font-family: HelveticaNeueCyrBold;
    font-size: 20px;
    color: #2C3D51;
    text-decoration: none;
    display: block;
}
.cm-phone-number:hover { color: #1c7ed6; }
.cm-phone-messengers {
    display: flex;
    gap: 8px;
    align-items: center;
}
.cm-phone-messengers a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    text-decoration: none;
    transition: opacity 0.2s, transform 0.15s;
}
.cm-phone-messengers a:hover { opacity: 0.85; transform: scale(1.1); }
.cm-messenger-viber    { background: #7360F2; }
.cm-messenger-whatsapp { background: #48C95F; }
.cm-messenger-telegram { background: #29B6F6; }

/* Locations */
.cm-locations-title {
    font-family: HelveticaNeueCyrBlack;
    font-size: 22px;
    color: #2C3D51;
    margin: 0 0 20px;
    padding-bottom: 14px;
    border-bottom: 2px solid #f0f2f5;
}
.cm-locations-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
}
.cm-location-card {
    background: #fff;
    border-radius: 14px;
    box-shadow: 0 2px 16px rgba(44,61,81,0.10);
    overflow: hidden;
    display: flex;
    flex-direction: column;
}
.cm-location-header {
    background: #2C3D51;
    padding: 18px 24px;
    display: flex;
    align-items: center;
    gap: 12px;
}
.cm-location-title {
    font-family: HelveticaNeueCyrBold;
    font-size: 17px;
    color: #fff;
    line-height: 1.3;
}
.cm-location-img {
    width: 100%;
    max-height: 220px;
    object-fit: cover;
    display: block;
}
.cm-location-body {
    padding: 22px 24px;
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 16px;
}
.cm-loc-row {
    display: flex;
    gap: 12px;
    align-items: flex-start;
}
.cm-loc-icon {
    flex-shrink: 0;
    margin-top: 1px;
    color: #1c7ed6;
}
.cm-loc-info-label {
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    color: #8D9293;
    font-family: HelveticaNeueCyrBold;
    margin-bottom: 4px;
}
.cm-loc-info-value {
    font-size: 14px;
    color: #2C3D51;
    line-height: 1.6;
}
.cm-location-map {
    position: relative;
    padding-bottom: 56.25%;
    height: 0;
    overflow: hidden;
}
.cm-location-map iframe {
    position: absolute;
    top: 0; left: 0;
    width: 100%;
    height: 100%;
    border: 0;
}

/* Responsive */
@media (max-width: 1024px) {
    .cm-locations-grid { grid-template-columns: 1fr; }
}
@media (max-width: 768px) {
    .cm-phones-grid { grid-template-columns: 1fr; }
}
@media (max-width: 480px) {
    .cm-phone-number { font-size: 18px; }
    .cm-location-body { padding: 16px; }
    .cm-location-header { padding: 14px 16px; }
    .cm-locations-title { font-size: 18px; }
}
</style>
<?php endif; ?>

<div class="container<?php echo ($information_id == 7) ? ' contacts-page' : ''; ?>">
    <ul class="breadcrumb">
        <?php $i = 0; $count = count($breadcrumbs); ?>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php $i++; if ($i != $count) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } else { ?>
                <li style="font-size:14px;line-height:20px;color:#8D9293;text-decoration:none;"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
        <?php } ?>
    </ul>

    <div class="row"><?php echo $column_left; ?>
        <div id="content"><?php echo $content_top; ?>
            <h1 class="title_h1"><?php echo $heading_title; ?></h1>

            <?php if ($information_id == 7): ?>

            <!-- Телефоны -->
            <p class="cm-section-label">Телефоны для связи</p>
            <div class="cm-phones-grid">

                <div class="cm-phone-card">
                    <a href="tel:+375296416496" class="cm-phone-number">+375 (29) 641-64-96</a>
                    <div class="cm-phone-messengers">
                        <a href="viber://chat?number=375296416496" class="cm-messenger-viber" title="Viber">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M17.009 7.784C16.694 7.494 15.422 6.57 12.589 6.558C12.589 6.558 9.248 6.356 7.619 7.85C6.713 8.757 6.394 10.084 6.36 11.729C6.327 13.374 6.283 16.457 9.255 17.293H9.258L9.256 18.569C9.256 18.569 9.237 19.085 9.577 19.19C9.988 19.318 10.23 18.926 10.622 18.503C10.838 18.27 11.135 17.929 11.36 17.668C13.392 17.839 14.955 17.448 15.133 17.391C15.543 17.258 17.865 16.96 18.243 13.877C18.633 10.7 18.054 8.69 17.009 7.784ZM10.743 11.716C10.743 11.716 11.183 13.383 12.829 13.804C13.055 13.823 13.176 13.673 13.176 13.673L13.412 13.376C13.526 13.228 13.801 13.134 14.071 13.284C14.473 13.464 14.837 13.791 15.205 14.097C15.379 14.244 15.42 14.46 15.301 14.688C15.169 14.92 15.003 15.124 14.808 15.299C14.634 15.444 14.467 15.525 14.304 15.544C14.018 15.516 13.34 15.259 12.639 14.873C11.485 14.11 10.966 13.65 10.896 13.58C10.733 13.416 10.436 13.061 10.15 12.698C9.894 12.312 9.673 11.907 9.038 10.533C9.002 10.242 9.022 10.079 9.244 9.742C9.422 9.543 9.626 9.377 9.853 9.246C10.086 9.126 10.302 9.166 10.449 9.34C10.756 9.707 11.021 10.076 11.189 10.474C11.318 10.743 11.326 11.048 11.17 11.133L10.873 11.369C10.723 11.491 10.743 11.716 10.743 11.716Z" fill="white"/></svg>
                        </a>
                        <a href="https://wa.me/375296416496" class="cm-messenger-whatsapp" title="WhatsApp" target="_blank">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M17.454 7.539C16.22 6.309 14.573 5.625 12.835 5.625C9.223 5.625 6.296 8.542 6.296 12.142C6.296 13.281 6.616 14.421 7.165 15.378L6.25 18.75L9.726 17.839C10.686 18.34 11.738 18.613 12.835 18.613C16.448 18.613 19.375 15.697 19.375 12.096C19.329 10.41 18.689 8.77 17.454 7.539ZM15.991 14.466C15.854 14.831 15.213 15.195 14.893 15.241C14.619 15.287 14.253 15.287 13.887 15.195C13.659 15.104 13.338 15.013 12.973 14.831C11.326 14.147 10.274 12.507 10.183 12.37C10.092 12.279 9.497 11.504 9.497 10.684C9.497 9.863 9.909 9.499 10.046 9.316C10.183 9.134 10.366 9.134 10.503 9.134C10.595 9.134 10.732 9.134 10.823 9.134C10.915 9.134 11.052 9.088 11.189 9.408C11.326 9.727 11.646 10.547 11.692 10.592C11.738 10.684 11.738 10.775 11.692 10.866C11.646 10.957 11.601 11.048 11.509 11.139C11.418 11.231 11.326 11.367 11.281 11.413C11.189 11.504 11.098 11.595 11.189 11.732C11.281 11.914 11.601 12.415 12.104 12.871C12.744 13.418 13.247 13.6 13.43 13.691C13.613 13.783 13.704 13.737 13.796 13.646C13.887 13.555 14.207 13.19 14.299 13.008C14.39 12.826 14.527 12.871 14.665 12.917C14.802 12.962 15.625 13.372 15.762 13.464C15.945 13.555 16.037 13.6 16.082 13.646C16.128 13.783 16.128 14.102 15.991 14.466Z" fill="white"/></svg>
                        </a>
                        <a href="https://t.me/+375296416496" class="cm-messenger-telegram" title="Telegram" target="_blank">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M5.844 12.734L8.718 13.805L9.838 17.41C9.887 17.653 10.179 17.702 10.374 17.556L11.982 16.241C12.128 16.095 12.371 16.095 12.566 16.241L15.44 18.335C15.635 18.481 15.927 18.384 15.976 18.14L18.119 7.912C18.167 7.668 17.924 7.425 17.68 7.522L5.844 12.101C5.552 12.198 5.552 12.636 5.844 12.734ZM9.692 13.27L15.342 9.811C15.44 9.763 15.537 9.909 15.44 9.957L10.813 14.293C10.666 14.439 10.52 14.633 10.52 14.877L10.374 16.046C10.374 16.192 10.131 16.241 10.082 16.046L9.497 13.903C9.351 13.659 9.449 13.367 9.692 13.27Z" fill="white"/></svg>
                        </a>
                    </div>
                </div>

                <div class="cm-phone-card">
                    <a href="tel:+375298000736" class="cm-phone-number">+375 (29) 800-07-36</a>
                    <div class="cm-phone-messengers">
                        <a href="viber://chat?number=375298000736" class="cm-messenger-viber" title="Viber">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M17.009 7.784C16.694 7.494 15.422 6.57 12.589 6.558C12.589 6.558 9.248 6.356 7.619 7.85C6.713 8.757 6.394 10.084 6.36 11.729C6.327 13.374 6.283 16.457 9.255 17.293H9.258L9.256 18.569C9.256 18.569 9.237 19.085 9.577 19.19C9.988 19.318 10.23 18.926 10.622 18.503C10.838 18.27 11.135 17.929 11.36 17.668C13.392 17.839 14.955 17.448 15.133 17.391C15.543 17.258 17.865 16.96 18.243 13.877C18.633 10.7 18.054 8.69 17.009 7.784ZM10.743 11.716C10.743 11.716 11.183 13.383 12.829 13.804C13.055 13.823 13.176 13.673 13.176 13.673L13.412 13.376C13.526 13.228 13.801 13.134 14.071 13.284C14.473 13.464 14.837 13.791 15.205 14.097C15.379 14.244 15.42 14.46 15.301 14.688C15.169 14.92 15.003 15.124 14.808 15.299C14.634 15.444 14.467 15.525 14.304 15.544C14.018 15.516 13.34 15.259 12.639 14.873C11.485 14.11 10.966 13.65 10.896 13.58C10.733 13.416 10.436 13.061 10.15 12.698C9.894 12.312 9.673 11.907 9.038 10.533C9.002 10.242 9.022 10.079 9.244 9.742C9.422 9.543 9.626 9.377 9.853 9.246C10.086 9.126 10.302 9.166 10.449 9.34C10.756 9.707 11.021 10.076 11.189 10.474C11.318 10.743 11.326 11.048 11.17 11.133L10.873 11.369C10.723 11.491 10.743 11.716 10.743 11.716Z" fill="white"/></svg>
                        </a>
                        <a href="https://wa.me/375298000736" class="cm-messenger-whatsapp" title="WhatsApp" target="_blank">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M17.454 7.539C16.22 6.309 14.573 5.625 12.835 5.625C9.223 5.625 6.296 8.542 6.296 12.142C6.296 13.281 6.616 14.421 7.165 15.378L6.25 18.75L9.726 17.839C10.686 18.34 11.738 18.613 12.835 18.613C16.448 18.613 19.375 15.697 19.375 12.096C19.329 10.41 18.689 8.77 17.454 7.539ZM15.991 14.466C15.854 14.831 15.213 15.195 14.893 15.241C14.619 15.287 14.253 15.287 13.887 15.195C13.659 15.104 13.338 15.013 12.973 14.831C11.326 14.147 10.274 12.507 10.183 12.37C10.092 12.279 9.497 11.504 9.497 10.684C9.497 9.863 9.909 9.499 10.046 9.316C10.183 9.134 10.366 9.134 10.503 9.134C10.595 9.134 10.732 9.134 10.823 9.134C10.915 9.134 11.052 9.088 11.189 9.408C11.326 9.727 11.646 10.547 11.692 10.592C11.738 10.684 11.738 10.775 11.692 10.866C11.646 10.957 11.601 11.048 11.509 11.139C11.418 11.231 11.326 11.367 11.281 11.413C11.189 11.504 11.098 11.595 11.189 11.732C11.281 11.914 11.601 12.415 12.104 12.871C12.744 13.418 13.247 13.6 13.43 13.691C13.613 13.783 13.704 13.737 13.796 13.646C13.887 13.555 14.207 13.19 14.299 13.008C14.39 12.826 14.527 12.871 14.665 12.917C14.802 12.962 15.625 13.372 15.762 13.464C15.945 13.555 16.037 13.6 16.082 13.646C16.128 13.783 16.128 14.102 15.991 14.466Z" fill="white"/></svg>
                        </a>
                        <a href="https://t.me/+375298000736" class="cm-messenger-telegram" title="Telegram" target="_blank">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M5.844 12.734L8.718 13.805L9.838 17.41C9.887 17.653 10.179 17.702 10.374 17.556L11.982 16.241C12.128 16.095 12.371 16.095 12.566 16.241L15.44 18.335C15.635 18.481 15.927 18.384 15.976 18.14L18.119 7.912C18.167 7.668 17.924 7.425 17.68 7.522L5.844 12.101C5.552 12.198 5.552 12.636 5.844 12.734ZM9.692 13.27L15.342 9.811C15.44 9.763 15.537 9.909 15.44 9.957L10.813 14.293C10.666 14.439 10.52 14.633 10.52 14.877L10.374 16.046C10.374 16.192 10.131 16.241 10.082 16.046L9.497 13.903C9.351 13.659 9.449 13.367 9.692 13.27Z" fill="white"/></svg>
                        </a>
                    </div>
                </div>

                <div class="cm-phone-card">
                    <a href="tel:+375297952640" class="cm-phone-number">+375 (29) 795-26-40</a>
                    <div class="cm-phone-messengers">
                        <a href="viber://chat?number=375297952640" class="cm-messenger-viber" title="Viber">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M17.009 7.784C16.694 7.494 15.422 6.57 12.589 6.558C12.589 6.558 9.248 6.356 7.619 7.85C6.713 8.757 6.394 10.084 6.36 11.729C6.327 13.374 6.283 16.457 9.255 17.293H9.258L9.256 18.569C9.256 18.569 9.237 19.085 9.577 19.19C9.988 19.318 10.23 18.926 10.622 18.503C10.838 18.27 11.135 17.929 11.36 17.668C13.392 17.839 14.955 17.448 15.133 17.391C15.543 17.258 17.865 16.96 18.243 13.877C18.633 10.7 18.054 8.69 17.009 7.784ZM10.743 11.716C10.743 11.716 11.183 13.383 12.829 13.804C13.055 13.823 13.176 13.673 13.176 13.673L13.412 13.376C13.526 13.228 13.801 13.134 14.071 13.284C14.473 13.464 14.837 13.791 15.205 14.097C15.379 14.244 15.42 14.46 15.301 14.688C15.169 14.92 15.003 15.124 14.808 15.299C14.634 15.444 14.467 15.525 14.304 15.544C14.018 15.516 13.34 15.259 12.639 14.873C11.485 14.11 10.966 13.65 10.896 13.58C10.733 13.416 10.436 13.061 10.15 12.698C9.894 12.312 9.673 11.907 9.038 10.533C9.002 10.242 9.022 10.079 9.244 9.742C9.422 9.543 9.626 9.377 9.853 9.246C10.086 9.126 10.302 9.166 10.449 9.34C10.756 9.707 11.021 10.076 11.189 10.474C11.318 10.743 11.326 11.048 11.17 11.133L10.873 11.369C10.723 11.491 10.743 11.716 10.743 11.716Z" fill="white"/></svg>
                        </a>
                        <a href="https://wa.me/375297952640" class="cm-messenger-whatsapp" title="WhatsApp" target="_blank">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M17.454 7.539C16.22 6.309 14.573 5.625 12.835 5.625C9.223 5.625 6.296 8.542 6.296 12.142C6.296 13.281 6.616 14.421 7.165 15.378L6.25 18.75L9.726 17.839C10.686 18.34 11.738 18.613 12.835 18.613C16.448 18.613 19.375 15.697 19.375 12.096C19.329 10.41 18.689 8.77 17.454 7.539ZM15.991 14.466C15.854 14.831 15.213 15.195 14.893 15.241C14.619 15.287 14.253 15.287 13.887 15.195C13.659 15.104 13.338 15.013 12.973 14.831C11.326 14.147 10.274 12.507 10.183 12.37C10.092 12.279 9.497 11.504 9.497 10.684C9.497 9.863 9.909 9.499 10.046 9.316C10.183 9.134 10.366 9.134 10.503 9.134C10.595 9.134 10.732 9.134 10.823 9.134C10.915 9.134 11.052 9.088 11.189 9.408C11.326 9.727 11.646 10.547 11.692 10.592C11.738 10.684 11.738 10.775 11.692 10.866C11.646 10.957 11.601 11.048 11.509 11.139C11.418 11.231 11.326 11.367 11.281 11.413C11.189 11.504 11.098 11.595 11.189 11.732C11.281 11.914 11.601 12.415 12.104 12.871C12.744 13.418 13.247 13.6 13.43 13.691C13.613 13.783 13.704 13.737 13.796 13.646C13.887 13.555 14.207 13.19 14.299 13.008C14.39 12.826 14.527 12.871 14.665 12.917C14.802 12.962 15.625 13.372 15.762 13.464C15.945 13.555 16.037 13.6 16.082 13.646C16.128 13.783 16.128 14.102 15.991 14.466Z" fill="white"/></svg>
                        </a>
                        <a href="https://t.me/+375297952640" class="cm-messenger-telegram" title="Telegram" target="_blank">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 25 25" fill="none"><path d="M5.844 12.734L8.718 13.805L9.838 17.41C9.887 17.653 10.179 17.702 10.374 17.556L11.982 16.241C12.128 16.095 12.371 16.095 12.566 16.241L15.44 18.335C15.635 18.481 15.927 18.384 15.976 18.14L18.119 7.912C18.167 7.668 17.924 7.425 17.68 7.522L5.844 12.101C5.552 12.198 5.552 12.636 5.844 12.734ZM9.692 13.27L15.342 9.811C15.44 9.763 15.537 9.909 15.44 9.957L10.813 14.293C10.666 14.439 10.52 14.633 10.52 14.877L10.374 16.046C10.374 16.192 10.131 16.241 10.082 16.046L9.497 13.903C9.351 13.659 9.449 13.367 9.692 13.27Z" fill="white"/></svg>
                        </a>
                    </div>
                </div>

            </div><!-- /.cm-phones-grid -->

            <!-- Адреса -->
            <h2 class="cm-locations-title">Наши адреса</h2>
            <div class="cm-locations-grid">

                <!-- Дрогичин -->
                <div class="cm-location-card" id="drogichen">
                    <div class="cm-location-header">
                        <svg class="cm-loc-icon" xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="#fbb005"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                        <span class="cm-location-title">Магазин-склад, г.&nbsp;Дрогичин</span>
                    </div>
                    <div class="cm-location-body">
                        <div class="cm-loc-row">
                            <svg class="cm-loc-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                            <div>
                                <div class="cm-loc-info-label">Адрес</div>
                                <div class="cm-loc-info-value">г. Дрогичин, ул. Заводская 20</div>
                            </div>
                        </div>
                        <div class="cm-loc-row">
                            <svg class="cm-loc-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67V7z"/></svg>
                            <div>
                                <div class="cm-loc-info-label">Режим работы</div>
                                <div class="cm-loc-info-value">ПН–СБ: 9:00–18:00<br>ВС: 10:00–13:00</div>
                            </div>
                        </div>
                    </div>
                    <div class="cm-location-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2672.3016055494736!2d25.109886815795043!3d52.18597747975241!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x46a1341481da31ed!2z0JDQstGC0L7Qt9Cw0L_Rh9Cw0YHRgtC4INCxL9GDINC40Lcg0JXQstGA0L7Qv9GLIC0gRDQuYnk!5e1!3m2!1sru!2sby!4v1608286382140!5m2!1sru!2sby" allowfullscreen loading="lazy"></iframe>
                    </div>
                </div><!-- /.cm-location-card -->

                <!-- Брест -->
                <div class="cm-location-card" id="brest">
                    <div class="cm-location-header">
                        <svg class="cm-loc-icon" xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="#fbb005"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                        <span class="cm-location-title">Пункт выдачи заказов, г.&nbsp;Брест</span>
                    </div>
                    <img src="https://d4.by/image/catalog/screenshot_1.png" class="cm-location-img" alt="Пункт выдачи Брест" loading="lazy" />
                    <div class="cm-location-body">
                        <div class="cm-loc-row">
                            <svg class="cm-loc-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
                            <div>
                                <div class="cm-loc-info-label">Адрес</div>
                                <div class="cm-loc-info-value">г. Брест, ул. Московская 364, пав.&nbsp;6<br><span style="color:#8D9293;font-size:13px;">(за территорией авторынка, внеплощадка)</span></div>
                            </div>
                        </div>
                        <div class="cm-loc-row">
                            <svg class="cm-loc-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67V7z"/></svg>
                            <div>
                                <div class="cm-loc-info-label">Режим работы</div>
                                <div class="cm-loc-info-value">ВТ–СБ: 9:00–15:30<br>ВС: 10:00–15:00<br>ПН: выходной</div>
                            </div>
                        </div>
                    </div>
                    <div class="cm-location-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4900.7278679540705!2d23.78129680825844!3d52.10950672079933!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47210ef499d57fa9%3A0x2e2073eea1e7dd2!2z0KDRi9C90L7QuiDQsNCy0YLQvtC30LDQv9GH0LDRgdGC0LXQuQ!5e0!3m2!1sru!2sby!4v1633353647627!5m2!1sru!2sby" allowfullscreen loading="lazy"></iframe>
                    </div>
                </div><!-- /.cm-location-card -->

            </div><!-- /.cm-locations-grid -->

            <?php else: ?>

            <div class="same_text">
                <?php echo $description; ?>
            </div>

            <?php endif; ?>

            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>

<?php echo $footer; ?>
