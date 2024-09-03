<?php
    use SilverStripe\Control\HTTP;
    use SilverStripe\Control\HTTPRequest;
    use SilverStripe\ORM\ArrayList;
    use SilverStripe\ORM\PaginatedList;
    use SilverStripe\Forms\Form;
    use SilverStripe\Forms\FieldList;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\DropdownField;
    use SilverStripe\Forms\FormAction;
    use SilverStripe\View\ArrayData;
    use SilverStripe\Security\Security;


    class AllProductPageController extends PageController{
    protected function init() {
        parent::init();
        $member = Security::getCurrentUser();
        if (!$member) {
            return $this->redirect('login');
        }
    }
        private static $allowed_actions = [
            'ProductSearchForm'
        ];

        public function index(HTTPRequest $request){
            $categories = ProductCategory::get();
            $product = ProductObject::get();
            $activeFilters = ArrayList::create();

            if($search = $request->getVar('Keywords')){
                $activeFilters->push(ArrayData::create([
                    'Label' => "'$search'"
                ]));
                $product = $product->filter([
                    'Title:PartialMatch' => $search
                ]);
            }
            if($search = $request->getVar('Category')){
                $activeFilters->push(ArrayData::create([
                    'Category' => ProductCategory::get()->filter(['ID' => $search])->first()->Title
                ]));
                $product = $product->filter([
                    'ProductCategory.ID' => $search
                ]);
            }
            if($search = $request->getVar('SubCategory')){
                $activeFilters->push(ArrayData::create([
                    'SubCategory' => ProductSubCategory::get()->filter(['ID' => $search])->first()->Title
                ]));
                $product = $product->filter([
                    'ProductSubCategory.ID' => $search
                ]);
            }
            $paginatedProduct = PaginatedList::create(
                $product,
                $request
            )->setPageLength(21)->setPaginationGetVar('s');
            $data = [
                'Results' => $paginatedProduct,
                'ActiveFilters' => $activeFilters,
                'Categories' => $categories
            ];
            return $data;
        }

        // public function ProductSearchForm(){
        //     $form = Form::create(
        //         $this,
        //         'ProductSearchForm',
        //         FieldList::create(
        //             TextField::create('Keywords')
        //                 ->setAttribute('placeholder', 'Search for Product'),
        //                 DropdownField::create('Category', 'Category', ProductCategory::get()->map('ID','Title'))
        //                 ->setEmptyString('Search in Category')
        //         ),
        //         FieldList::create(FormAction::create('doProductSearh', 'Search'))
        //     );
        //     $form->setFormMethod('GET')
        //         ->setFormAction($this->link())
        //         ->disableSecurityToken()
        //         ->loadDataFrom($this->request->getVars());
                
        //         return $form;
        // }
    }