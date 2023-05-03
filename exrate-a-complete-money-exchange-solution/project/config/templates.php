<?php
return [
    'hero' => [
        'field_name' => [
            'title' => 'text',
            'sub_title' => 'text',
            'short_description' => 'textarea',
            'button_name' => 'text',
            'button_link' => 'url',
        ],
        'validation' => [
            'title.*' => 'required|max:100',
            'sub_title.*' => 'required|max:2000',
            'button_name.*' => 'required|max:2000',
            'button_link.*' => 'required|max:2000',
        ]
    ],

    'how-it-work' => [
        'field_name' => [
            'title' => 'text',
            'sub_title' => 'text',
            'short_description' => 'textarea',
        ],
        'validation' => [
            'title.*' => 'required|max:100',
            'sub_title.*' => 'required|max:100',
            'short_description.*' => 'required|max:2000',
        ]
    ],

    'about-us' => [
        'field_name' => [
            'title' => 'text',
            'sub_title' => 'text',
            'short_description' => 'text',
            'description' => 'textarea',
            'button_name' => 'text',
            'button_link' => 'url',
            'image' => 'file'
        ],
        'validation' => [
            'title.*' => 'required|max:100',
            'sub_title.*' => 'required|max:100',
            'short_description.*' => 'required|max:2000',
            'short_description.*' => 'required|max:10000',
            'button_name.*' => 'required|max:2000',
            'button_link.*' => 'required|max:2000',
            'image.*' => 'nullable|max:3072|image|mimes:jpg,jpeg,png',
        ],
        'size' => [
            'image' => '450x450'
        ]
    ],

    'latest-exchange' => [
        'field_name' => [
            'title' => 'text',
        ],
        'validation' => [
            'title.*' => 'required|max:100',
        ]
    ],

    'faq' => [
        'field_name' => [
            'title' => 'text',
            'sub_title' => 'text',
            'short_description' => 'textarea',
            'image' => 'file'
        ],
        'validation' => [
            'title.*' => 'required|max:100',
            'sub_title.*' => 'required|max:100',
            'short_description.*' => 'required|max:2000',
            'image.*' => 'nullable|max:3072|image|mimes:jpg,jpeg,png',
        ],
        'size' => [
        'image' => '450x450'
        ]
    ],

    'testimonial' => [
        'field_name' => [
            'title' => 'text',
            'sub_title' => 'text',
            'short_description' => 'textarea',
        ],
        'validation' => [
            'title.*' => 'required|max:100',
            'sub_title.*' => 'required|max:2000',
            'short_description.*' => 'required|max:2000',
        ]
    ],

    'blog' => [
        'field_name' => [
            'title' => 'text',
            'sub_title' => 'text',
            'short_description' => 'textarea',
        ],
        'validation' => [
            'title.*' => 'required|max:100',
            'sub_title.*' => 'required|max:2000',
            'short_description.*' => 'required|max:2000'
        ]
    ],


    'contact-us' => [
        'field_name' => [
            'heading' => 'text',
            'sub_heading' => 'text',
            'address' => 'text',
            'email' => 'text',
            'phone' => 'text',
            'footer_short_details' => 'textarea'
        ],
        'validation' => [
            'heading.*' => 'required|max:100',
            'sub_heading.*' => 'required|max:100',
            'address.*' => 'required|max:2000',
            'email.*' => 'required|max:2000',
            'phone.*' => 'required|max:2000',
            'footer_short_details.*' => 'required|max:10000'
        ]
    ],
    'message' => [
        'required' => 'This field is required.',
        'min' => 'This field must be at least :min characters.',
        'max' => 'This field may not be greater than :max characters.',
        'image' => 'This field must be image.',
        'mimes' => 'This image must be a file of type: jpg, jpeg, png.',
    ],
    'template_media' => [
        'image' => 'file',
        'thumbnail' => 'file',
        'youtube_link' => 'url',
        'button_link' => 'url',
    ]
];
